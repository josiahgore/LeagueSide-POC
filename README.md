# README

The simple web service can be found at `leagues_controller.rb`

It sits on a postgres instance for persistence. There is a barebones UI for manual testing. Probably should have spent more time on the service itself and less on that. All API responses are simply logged to the console. UI does not update (unless you refresh).

Steps for standing up the service:

```
# install postgresql
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql

# create database
sudo -u postgres psql -c 'create extension if not exists earthdistance cascade;'
sudo -u postgres psql -c 'create database leagueside_dev;'
sudo -u postgres psql -c "create user leagueside with encrypted password 'leagueside';"
sudo -u postgres psql -c 'grant all privileges on database leagueside_dev to leagueside;'

# create schema and run server
rails db:migrate
rails s
```
