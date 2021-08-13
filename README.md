# Products and Reviews by Andrew Giang
This project creates an application that tracks user created products and reviews using a one-to-many relationship. On the application, you can view, add, update, and delete instances of both. 

## Technology Used
* _Ruby_
* _rails_
* _Docker_
* _Ruby Gems: rspec, pry, faker, bootstrap, capybara, shoulda-matchers, simplecov_
* _Postgres_

## Objectives

* Full CRUD functionality for both `products`s and `reviews`s.
* Routes are named using RESTful conventions.
* Sinatra application uses views, instance variables and forms.
* Sinatra routes process GET and POST requests/responses.
* Project includes thorough and passing integration specs as well as specs for both classes.

## Set up and Installation
* This project runs on Ruby or Docker. You need to have either application installed on your local machine.
* Download or Clone this directory into your local drive.
* In your terminal, go to the project's root directory and run `compose up --build`
* If you nagivate to `http://localhost:3000/` without setting up a database, though, you'll get a `PG::ConnectionBad` error.
* You will need to create the database and seed the database in order for the live server to render. To create a database on your local machine, you will need to run `rake db:create` and run migrations to create this project's tables by running `rake db:migrate` and `rake db:test:prepare`
* Once the database is set up, you can navigate to `http://localhost:3000/` to see the landing page
* If you want to seed the database with fake data, you can run `rake db:seed`
* To run tests, you need to bundle install rspec by running `bundle exec rails generate rspec:install`. Then replace `spec` directories with your own tests (for `spec`). Then run the command `rspec` in terminal
* When you're done running the server, you should always type in `docker-compose down` to gracefully stop the container.

## Known Bugs

* none

## License

[MIT](https://en.wikipedia.org/wiki/MIT_License)

## Contact Information

Andrew Giang | giang184@gmail.com
