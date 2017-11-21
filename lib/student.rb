require_relative "../config/environment.rb"

class Student
  attr_accessor :id, :name, :grade
  def initialize(id = nil, name, grade)
    @id = id
    @name = name
    @grade = grade
  end

  def save
    sql = <<-SQL
      INSERT INTO students (name, grade)
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.grade)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end

  def self.create_table(name:, grade:)
    new_student = Student.new(name, grade)
    new_student.save
    new_student
  end
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]


end
