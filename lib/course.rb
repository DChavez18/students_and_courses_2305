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
    @full
  end

  def enroll
    
  end

end
