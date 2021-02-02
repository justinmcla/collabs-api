# Collabs API

Collabs is a social networking web application for creatives, served by this API. The client-side application is located <a href="https://github.com/justinmcla/collabs">here</a>.

## Getting Started

Contributors to this open-source project are encouraged to read this file thoroughly to ensure local development environments are set up correctly. Please properly handle all contributions to this repository following the contributions guidelines at the bottom of this README.

### Dependencies

This API is built on <strong>Rails 6.0.3</strong> & <strong>Ruby 2.6.1</strong>. Upon forking and cloning to your local environment, run `bundle install` to install all `Gemfile` dependencies.

### Database

The database is built on <strong>PostgreSQL 13.1</strong>. It is helpful, albeit not necessary, to utilize a database software (such as Postico or pgAdmin) that allows you to view tables in the database. Upon installing your `Gemfile` dependencies, run `rails db:create` and `rails db:migrate` to create the database and execute the migration files laid out in `db/migrate/`.

#### Seed Data

Running `rails db:seed` will execute the code as laid out in `db/seeds.rb`. This will provide your local development database with starter data to utilize in development. This file will be segmented out into comment blocks to provide you with a broad range of starter data, without needing to run the entire file at once. Uncomment seed data as needed before running `rails db:seed`.



TBD:

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
