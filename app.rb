require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'sinatra/activerecord'
# require './lib/task'
# require './lib/list'
require 'pry'

also_reload('lib/**/*.rb')
