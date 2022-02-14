# Documentation

This is a REST API project builded with Ruby on Rails.

This API is able to collect all repositories from an Github User.

## Setting
Before run the app for first time, is essentially to execute some commands to set up the app.

Starting to install all gems, then configurating local database to finish executing the project we need to use the next commands.

```ruby
bundle install       # Install gems from Gemfile
rails db:create      # Create local Database
rails db:migrate     # Run migrations to create tables
rails server         # Start application on port 5000
```

## Important Routes
For this application we have three routes, which are:

- To insert a new User and their Repositories
  - `/api/v1/users`
  - In this route we need to send a parameter, this is `username`
  - ![imagen](https://user-images.githubusercontent.com/38772008/153796992-9870bea8-567d-4e7d-a79b-b622f387cd6a.png)
- To consult all Repositories on Database
  - `/api/v1/repos/list`
- To search for a Repository by name
  - `/api/v1/repos/search`
  - We need to send the next parameter `repository_name`
  - ![imagen](https://user-images.githubusercontent.com/38772008/153797203-4f7f2181-9435-4d14-904e-5808d92eeea4.png)

## Test
Test were created with RSpec.

To execute all tests use `rspec` command.


### Requirements
```
Ruby        3.0.1
Rails       6.1.4.4
PostgreSQL  12.9
```
