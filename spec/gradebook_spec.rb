require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Gradebook do
  before(:each) do
    @gradebook = Gradebook.new("Prof. Chavez", [])
    @course1 = Course.new(:Calculus, 2)
    @course2 = Course.new(:CS, 3)
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})
    @student3 = Student.new({name: "Felix", age: 27})
  end

  it 'exists' do
    expect(@gradebook).to be_a(Gradebook)
  end

  it "has attributes" do
    expect(@gradebook.instructor).to eq("Prof. Chavez")
    expect(@gradebook.courses).to eq([])
    @gradebook.add_course(@course1)
    @gradebook.add_course(@course2)
    expect(@gradebook.courses).to eq([@course1, @course2])
  end

  it "can list all students in courses" do
    @gradebook.add_course(@course1)
    @gradebook.add_course(@course2)
    @course1.enroll(@student1)
    @course1.enroll(@student2)
    @course2.enroll(@student1)
    @course2.enroll(@student2)
    @course2.enroll(@student3)
    expected_data = {Calculus: ["Morgan", "Jordan"], CS: ["Morgan", "Jordan", "Felix"]}
    expect(@gradebook.list_all_students).to eq(expected_data)
  end

  it 'can check students below threshold' do
    expect(@gradebook.students_below).to eq([])
  end
end
