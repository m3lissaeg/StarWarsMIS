# Star Wars MIS


## Install

### Clone the repository

```shell
git clone git@github.com:m3lissaeg/StarWarsMIS.git
cd StarWarsMIS
```
### Ruby, Rails and Postgres version

```shell
ruby:         2.6.3
rails:        6.1.3
postgres gem: pg 1.2
```
Check out the Gemfile to know about other gems used in this project.

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.6.3`

If not, install the right ruby version using rvm or [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.6.3
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) 

```shell
bundle install
```

### Initialize the database
To create the database, load the schema, and initialize it with the seed data:

```shell
rails db:setup
```
### Run tests

Finally, run the test suite to verify that everything is working correctly:

```shell
$ rails test
```

If the test suite passes, you’ll be ready to seed the database with sample users and run the app in a local server:

## Serve

```shell
rails s
```
And now you can visit the site with the URL http://localhost:3000