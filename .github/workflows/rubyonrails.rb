# This workflow uses actions that are not certified by GitHub.  They are
# provided by a third-party and are governed by separate terms of service,
# privacy policy, and support documentation.
#
# This workflow will install a prebuilt Ruby version, install dependencies, and
# run tests and linters.
name: "Ruby on Rails CI"
on:
  push:
    branches: ["main"]
  pull_request:
    branches: ["main"]
jobs:
  test:
    env:
      RAILS_ENV: test
      RAILS_MASTER_KEY: ${{ secrets.MASTER_KEY }}
      DATABASE_URL: "postgres://rails:password@localhost:5432/rails_test"
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:11-alpine
        ports:
          - "5432:5432"
        env:
          POSTGRES_DB: rails_test
          POSTGRES_USER: rails
          POSTGRES_PASSWORD: password
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      # Add or replace dependency steps here
      - name: Install Ruby and gems
        uses: ruby/setup-ruby@v1 # v1.146.0
        with:
          bundler-cache: true
      # Add or replace database setup steps here
      - name: Set up database schema
        run: bin/rails db:schema:load
      # Add or replace test runners here
      - name: Run tests
        run: bin/rake

  lint:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      - name: Install Ruby and gems
        uses: ruby/setup-ruby@v1 # v1.146.0
        with:
          bundler-cache: true
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      # Add or replace any other lints here
      - name: Install dependencies
        run: bin/bundle install
      - name: Lint Ruby files
        run: bundle exec rubocop --format github
