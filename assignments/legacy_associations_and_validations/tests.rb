# Basic test requires
require 'minitest/autorun'
require 'minitest/pride'

# Include both the migration and the app itself
require './migration'
require './application'

# Overwrite the development database connection with a test connection.
ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'test.sqlite3'
)

# Gotta run migrations before we can run tests.  Down will fail the first time.
begin ArExperimentsMigration.migrate(:down); rescue; end
ArExperimentsMigration.migrate(:up)


# Finally!  Let's test the thing.
class ArExperimentsTest < Minitest::Test

  def test_employee_io
    mason = Employee.create!(name: "Mason", salary: 10000)
    assert_equal "Mason", mason.name
    assert_equal 10000, mason.salary
  end

  def test_employee_raise
    mason = Employee.create!(name: "Mason", salary: 10000)
    mason.give_raise(1000)
    assert_equal 11000, mason.salary
  end

  def test_dept_io
    sales = Department.create!(name: "Sales")
    assert_equal "Sales", sales.name
  end

  def test_dept_employees
    sales = Department.create!(name: "Sales")
    assert sales.employees.empty?
    sales.add_employee(Employee.create!(name: "Amy", salary: 10000))
    assert_equal 1, sales.employees.length
    sales.add_employee(Employee.create!(name: "Bonnie", salary: 20000))
    assert_equal 2, sales.employees.length
    assert_equal 20000, sales.employees.last.salary
  end

  def test_total_salary
    sales = Department.new(name: "Sales")
    sales.add_employee(Employee.new(name: "Amy", salary: 10000))
    sales.add_employee(Employee.new(name: "Bonnie", salary: 20000))
    assert_equal 30000, sales.total_salary
  end
end
