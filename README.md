# Ruby on Rails Web App
This is a web application that shows authors and their books.

## Getting started
To get started, clone the repo and then install the needed
gems:
```
$ bundle install --without production
```
Next, migrate the database:
```
$ rails db:migrate
```
Finally, run the test suite to verify that everything is working
correctly:
```
$ rails test
```
If the test suite passes, you'll be ready to run the app in a local
server:
```
$ rails server
```
