# Star Wars MIS


## Install

### Clone the repository

```shell
git clone git@github.com:m3lissaeg/StarWarsMIS.git
cd StarWarsMIS
```

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

```shell
rails db:create db:migrate db:seed
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