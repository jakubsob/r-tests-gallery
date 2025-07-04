# Plumber API

Use this pattern to test that a [Plumber](https://www.rplumber.io/) API responds to requests as expected. Launch API in a background process with [`mirai`](https://mirai.r-lib.org/) and make requests with [`httr2`](https://httr2.r-lib.org/).

## When to use this pattern?

Use it for testing a Plumber API you own.

## How to use this pattern?

1. Manage the API-related setup in a `setup-api.R` file.
2. Use `mirai` to not block the testing process.
3. Use `httr2` to make **serial** requests to the API.
