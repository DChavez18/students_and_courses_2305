class University
  def all_grades
    grade_data = {}
    gradebook.courses.each do |course|
      grade_data[course] = course.students.map(&:grade)
    end
    grade_data
  end
end