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
  Division.create(title: division)
  redirect('/divisions')
  @divisions = Division.all
  erb(:divisions)
end

# route to see employee list
get("/employees") do
@employees = Employee.all
  erb(:employees)
end

# route to add an employee to db
post("/add_employee") do
  employee = params['add-employee']
  Employee.create(name: employee)
  redirect('/employees')
end

# path to individual division
get("/division/:id") do
  @division = Division.find(params['id'].to_i)
  erb(:division)
end

# path tp update division name
patch("/edit_division/:id") do
  new_title = params['edit-title']
  division = Division.find(params['id'].to_i)
  division.update(title: new_title)
  redirect("/division/#{division.id}")
end

# path to delete a division
delete("/delete_division/:id") do
  division = Division.find(params['id'].to_i)
  division.delete
  redirect("/divisions")
end
