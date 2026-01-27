.PHONY: link stow-all

help:
	@echo "Available targets:"
	@echo "  link     - make symbolic links in home folder"
	@echo "  stow-all - make symbolic links via stow"
	@echo "  help     - Show this help message"

link:
	bash scripts/link.sh

stow-all:
	stow --target=$HOME --ignore='.*\.example' --adopt --verbose zsh ghostty starship nvim actrc
