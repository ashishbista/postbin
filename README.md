# Postbin

If you want to debug webhooks without exposing your critial informations
to anyone, set it up locally. It's a typical Rails app.

## Running

1. Clone the repo.
2. Run `bundle install`
3. Run `rake db:setup`
4. Start the server `rails s`

If requires PostgreSQL.

## Running Tests
Run `bin/configure` once, then `bin/docker-ci`.

