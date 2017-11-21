require_relative "../config/environment.rb"

class Student
  attr_accessor :id, :name, :grade
  def initialize(id = nil, name, grade)
    @id = id
    @name = name
    @grade = grade
  end

  def self.create_table(name:, grade:)
    new_student = Student.new(name, grade)
    new_student
  end
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]


end
