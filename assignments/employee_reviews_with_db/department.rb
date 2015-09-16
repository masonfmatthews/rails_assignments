class Department

  attr_reader :name, :employees

  def initialize(name)
    @name = name
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def total_salary
    @employees.reduce(0){|sum, employee| sum + employee.salary}
  end

  def give_raise(total_amount)
    getting_raise = @employees.select {|e| e.satisfactory?}
    getting_raise.each {|e| e.give_raise(total_amount / getting_raise.length)}
  end
end
