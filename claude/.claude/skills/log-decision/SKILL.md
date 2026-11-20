---
name: log-decision
description: Log a decision into DECISION_LOG.md. Use when asked "Log a decision" or similar.
---
# Log a decision

All the important architectural decisions are written in `DECISIONS_LOG.md`. If it does not exist, create one on the first decision.

### Guidelines

  - list all considered options, list bullet points of pros and cons (as concisely as possible) under every option
  - pros and cons, that were deciding factor can be bolded.
  - choice can include a reason, but does not have to if highlighted pros/cons explain enough.
  - not yet decided (choice empty) is allowed.
  - single option decisions as well as not usable options should be also logged.

<FormatExample>
### Decision

(optional) 1-2 sentences describing context.

  1. option

    - +pros
    - -**cons**

  2. option

    - +**pros**
    - -cons

  choice: option - (optional) reason
</FormatExample>

### Examples

```md
### DB Driver

  1. psycopg

    - **+sync and async**
    - **++minimal**
    - +sql query sanitation
    - +dynamic sql query factory -> used for INSERT queries (build dynamically based on req dict keys)
    - +row factory
    - -pg only

  2. asyncpg

    - ++even faster, than psycopg
    - +sql query sanitation
    - -async only
    - -pg only


  choice: psycopg
```

```md
### DB ID

  1. incerement ID

    - +appending record into page does not need to re-index
    - -insecure direct object reference
    - -servers attempting to insert record with the same ID

  2. UUID v4

    - +random
    - -"page split" - need to re-index, when new record is inserted

  3. UUID v7

    - +random
    - +first half is unix timestamp - avoids page splits
    - -need to update database to pg18

  choice: UUID v7
```

```md
### Postgres version

  1. v14 - initial

  2. v18

    - +UUID v7

  choice: v18
```

```md
### Endpoint definitions

  1. response_model=User/Location/Meter/ReadingResponse + return dict

    - +docs, primary source
    - +single pydantic validation
    - -typechecker safety needs additional TypedDicts (or NamedTuples from DB repositories)

  2. annotation -> User/Location/Meter/ReadingResponse + return User.Location/Meter?ReadingResponse

    - +docs, fallback source
    - +typechcker safe
    - -double pydantic validation

  choice: response_model
```

#### Examples with a reason

```md
### ORM or not

  1. sqlmodel (=pydantic + sql alchemy wrapper)

    - +FastAPI docs recommended
    - -async not documented
    - --db and req/resp validation models coupled

  2. SQLAlchemy

    - +easy to switch db engine (sql only)
    - +handles security
    - -subjective: session abstraction mental model (session.add, commit, rollback)

  3. No ORM

    - +no bloat
    - +SQL-like queries and db cmds (commit, rollback, etc.)
    - -security

  choice: no ORM - totally sufficient, yet minimal
```

```md
### Dockerfile base image

  1. alpine - 209MB, 1.1s

    - +tiny size
    - +reduced attack surface
    - -a bit of a learning curve
    - -build times slower, bcs of compiling dependencies
    - -Musl LibC

  2. slim - 345MB, 0.8s

    - +familiar commands
    - +GLibC (psycopg dependency)

  choice: slim - bcs of psycopg and faster build times
```

```md
### ENV vars config

  1. python-dotenv

    - +centralized
    - -ENV vars missing in test GH action -> add them manually via os.environ -> linting issue (env vars have to be set prior to imports) -> pytest-env

  2. pydantic-settings

    - +centralized
    - +variables validation, unless extra=ignore
    - +type validation - not really utilized in this backend
    - +configs split - db, aws, jwt, etc.
    - +lru_cached get_settings functions complement with FastAPI's dependency injection system
    - -nested configs - not really usable - require __ in env var names

  choice: pydantic-settings - bcs it is PROD grade and acc. to fastapi docs
```

#### Single option example

```md
### Working Hours

  Google Places API fetch currentOpeningHours, regularOpeningHours or special hours

    - -Cannot fetch/curl without API keys - have to be hidden -> solution: Serverless functions.
    - -Google pages limit: free 1,000 calls/month -> call every 1hr (up to 744x per month)
    - -Cloudflare Workers limit: 100k / day
```

**Record even handy stuff, that cannot be used:**

```md
### FastAPI.users for user management

  Cannot be used -> requires SQLAlchemy.
```
