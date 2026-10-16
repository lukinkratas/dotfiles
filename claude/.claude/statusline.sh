#!/bin/bash
input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.id')
EFFORT_LVL=$(echo "$input" | jq -r '.effort.level')
DIR=$(echo "$input" | jq -r '.workspace.current_dir')
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
CTX_PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0')
INP_TOKENS=$(echo "$input" | jq -r '.context_window.total_input_tokens')
OUT_TOKENS=$(echo "$input" | jq -r '.context_window.total_output_tokens')
EXCEEDS=$(echo "$input" | jq -r '.exceeds_200k_tokens')
DURATION_MS=$(echo "$input" | jq -r '.cost.total_duration_ms // 0')

# "// empty" produces no output when rate_limits is absent
FIVE_H_LMT=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
WEEK_LMT=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

CYAN='\033[36m'; GREEN='\033[32m'; YELLOW='\033[33m'; RED='\033[31m'; RESET='\033[0m'

# bar <percent>  ->  colored 10-cell bar + "NN%"  (or "--" when value is missing)
bar() {
  [ -z "$1" ] && { printf '░░░░░░░░░░ --'; return; }
  local pct; pct=$(printf '%.0f' "$1")          # 42.7 -> 43
  local color=$GREEN
  [ "$pct" -ge 70 ] && color=$YELLOW
  [ "$pct" -ge 90 ] && color=$RED
  local filled=$(( pct / 10 )); (( filled > 10 )) && filled=10
  local empty=$(( 10 - filled )) fill pad
  printf -v fill "%${filled}s"; printf -v pad "%${empty}s"
  printf '%b%s%b %s%%' "$color" "${fill// /█}${pad// /░}" "$RESET" "$pct"
}

MINS=$((DURATION_MS / 60000)); SECS=$(((DURATION_MS % 60000) / 1000))

BRANCH=""
git rev-parse --git-dir > /dev/null 2>&1 && BRANCH=" | $(git branch --show-current 2>/dev/null)"

echo -e "${CYAN}[$MODEL $EFFORT_LVL]${RESET} ${DIR##*/}$BRANCH"
echo -e "ctx: $(bar "$CTX_PCT") in:${INP_TOKENS} out:${OUT_TOKENS} exceeds 200k:${EXCEEDS} | ${YELLOW}$(printf '$%.2f' "$COST")${RESET} | ${MINS}m ${SECS}s"
echo -e "5h:  $(bar "$FIVE_H_LMT") | 7d: $(bar "$WEEK_LMT")"
