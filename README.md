# SzamaPwr

App for KNTAW workshops.

### Initial setup
```
git clone git@github.com:hussar-academy/szama-pwr.git
cd szama-pwr
bundle install
rake db:create
rake db:migrate
```

### Run the server
```
rails s
```
Application is then available at `localhost:3000`
List of users `localhost:3000/users`


### A few usefull commands

```bash
# Yes, rails gives some help
rails --help

# Create new app without javascripts, unit tests
rails new APP_NAME -J -T

# Next commands generate basic models relation in the application
rails g model MODEL_NAME field:type
Example: rails g model User name:string balance:decimal

rails g controller CONTROLLER_NAME
Example: rails g controller users
```
