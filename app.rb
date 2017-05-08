require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'sinatra/activerecord'
require './lib/division'
require './lib/employee'
require 'pry'

also_reload('lib/**/*.rb')

# route to index
get("/") do
  erb(:index)
end

# route to see division
get("/divisions") do
  @divisions = Division.all
  erb(:divisions)
end

# route to add a division to db
post("/add_division") do
  division = params['add-division']
  Division.create({:title => division})
  redirect('/divisions')
end

get("/employees") do
  erb(:employees)
end
