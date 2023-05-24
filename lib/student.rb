class Student
  attr_reader :name,
              :age,
              :scores

  def initialize(student_details)
    @name = student_details[:name]
    @age = student_details[:age]
    @scores =[]
  end

  def log_score(score)
    @scores << score
  end

  def grade
    total_score = @scores.sum
    grade = total_score.to_f/@scores.length
  end
 
end
