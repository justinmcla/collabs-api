# Collabs API

Collabs is a social network for creatives to find new collaboratiors to work with on artistic endeavors. This server-side API is built on Ruby on Rails, and serves a front-end single-page application built in React with Redux.

## Getting Started

### Dependencies

This API is built on <strong>Rails 6.0.3</strong> & <strong>Ruby 2.6.6</strong>. Upon forking and cloning to your local environment, run `bundle install` to install all `Gemfile` dependencies.

##### Database

The database is built on <strong>PostgreSQL 13.1</strong>. It is helpful, albeit not necessary, to utilize a database software (such as Postico or pgAdmin) that allows you to view tables in the database. Upon installing your `Gemfile` dependencies, run `rails db:create` and `rails db:migrate` to create the database and execute the migration files laid out in `db/migrate/`.

##### Seed Data

Running `rails db:seed` will execute the code as laid out in `db/seeds.rb`. This will provide your local development database with starter data to utilize in development. This file will be segmented out into comment blocks to provide you with a broad range of starter data, without needing to run the entire file at once. Uncomment seed data as needed before running `rails db:seed`.

##### Environment Variables

You will need to create a `.env` file in the `root` directory and declare several environment variables.

- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY

For security purposes, please contact Justin at justin [at] devjwm [dot] net for assistance on getting set up with the AWS environment variables.

## Contributing

Fork and clone this repository to your local environment. To keep things organized, please use the following naming system for new branches:

```shell
ft/bg - change - issue number
```

For example, a branch made to close this issue:

<strong><em>Issue #17 - Reset form button does not clear form</em></strong>

Should be named:

```shell
bg-resetbuttonfix-17
```

Pull requests will be reviewed as they are received. Contributions should be limited to bug fixes, unless the feature request is marked as cleared for contribution.

## License

MIT.
