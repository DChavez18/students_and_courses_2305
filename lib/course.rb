class Course

  attr_reader :name,
              :capacity,
              :students
  def initialize(name, capacity)
    @name = name
    @capacity = 2
    @students = []
    @full = false
  end

  def full?
    @students.length >= @capacity
  end

  def enroll(student)
    @students << student
  end

end
