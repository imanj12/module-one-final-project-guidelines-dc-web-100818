require_relative '../lib/artist.rb'
require_relative '../lib/venue.rb'
require_relative '../lib/event.rb'
require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
