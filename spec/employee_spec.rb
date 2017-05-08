require 'spec-helper'

describe(Employee) do
  describe("#division") do
    it("tells which division the employee belongs to") do
      test_division = Division.create({:title => "HR"})
      test_employee = Employee.create({:name => "Marko", :division_id => test_division.id})
      expect(test_employee.division).to(eq(test_division))
    end
  end

  describe('name') do
    it("will return the name of the employee") do
      employee = Employee.create({:name => "Marko"})
      expect(employee.name).to(eq("Marko"))
    end
  end
end
