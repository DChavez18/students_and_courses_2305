require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'
require './lib/university'

RSpec.describe University do
  before(:each) do
    @university_of_denver = University.new
    @gradebook = Gradebook.new("Prof. Chavez", [])
    @course1 = Course.new(:Calculus, 2)
    @course2 = Course.new(:CS, 3)
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})
    @student3 = Student.new({name: "Felix", age: 27})
  end

  it 'exists' do
    expect(@university_of_denver).to be_a(University)
  end

  it 'can list all grades in courses' do
    @gradebook.add_course(@course1)
    @course1.enroll(@student1)
    @student1.log_score(83.5)
    grade_data = {@course1 => [83.5]}
    expect(@university_of_denver.all_grades).to eq(grade_data)
  end
end