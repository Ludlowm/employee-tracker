require 'spec-helper'

describe(Division) do
  it("has many employees") do
    division = Division.create({:title => "HR"})
    employee1 = Employee.create({:name => "Sean", :division_id => division.id})
    employee2 = Employee.create({:name => "Marco", :division_id => division.id})
    expect(division.employees).to(eq([employee1, employee2]))
  end
end
