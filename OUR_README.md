# Eventster
> Your national CLI-based concert finding tool!

Welcome to Eventster! Given an artist, find any show in any city in the United States! Return the date, venue, and ticket prices, where available.

This is a CLI-based application and as such, is somewhat limited in functionality. The goal of this project is to demonstrate CLI-based functionality with a RUBY core, while querying the TicketMaster API and saving results in a database.

## Features
1. Search for shows by artist and city
2. Search for shows by venue and city
3. Search for shows by genre and city

## Data Model


## Installation
This is not a standalone executable. We recommend forking this entire directory and cloning it down. The run.rb file in /bin depends on quite a few other files.

This is write-up assumes you have a working Ruby environment on your computer with SQLite3 installed. If not, set this up first.

### 1. Create Database
Cd into the root installation directory and run the following Rake task:
`rake db:create`
This will create the database that will store the results of your TciketMasterAPI query--and all artist, event, and venue objects.
### 2. Migrate tables and changes to DB
`rake db:migrate`

Your environment is now set up.

## Usage

To start the app, run `ruby /bin/run.rb` from the installation directory.
