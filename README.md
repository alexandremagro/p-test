# P-test

### Prerequisites

- Ruby 2.6.5
- PostgreSQL

### Installation

Configure local environment, creating a `.env` file in root and set local
PostgreSQL credentials. Example:

```
DATABASE_USERNAME=postgres
DATABASE_PASSWORD=password
```

Install dependencies:

```
bundle && yarn
```

Initialize local databases:

```
rails db:create db:migrate
```

## Development

Running locally:

```
rails s
```

Running code reviews:

```
yarn lint
rubocop
```

Running tests:

```
rails test
rails test:system
```


## Authors

Alexandre Magro (alx.magro@gmail.com)
