class Gradebook
  attr_reader :instructor, 
              :courses

  def initialize(instructor, courses)
    @instructor = instructor
    @courses = []
  end
  
  def add_course(course)
    @courses << course
  end

  def list_all_students
    students_by_course = {}
    @courses.each do |course|
      students_by_course[course.name] = course.students.map(&:name)
    end
    students_by_course
  end

  def students_below
    below_threshold_students = []
    @courses.each do |course|
      course.students.each do |student|
        below_threshold_students << student.name if student.grade < 70
      end
    end
    below_threshold_students
  end
  
end
