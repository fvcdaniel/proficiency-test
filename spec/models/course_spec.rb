require 'rails_helper'

describe Course do

  before { @course = Course.new(name: "Curso de Rails", description: 'curso de proficiencia', status: 1) }

  subject { @course }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:status) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @course.name = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @course.name = "a" * 46 }
    it { should_not be_valid }
  end
  
  describe "when status is different then 1,2" do
    before { @course.status = 3 }
    it { should_not be_valid }
  end
  
  describe "when description is too long" do
    before { @course.description = "a" * 46 }
    it { should_not be_valid }
  end
  
  describe "when name is already taken" do
    before do
      course_with_same_name = @course.dup
      course_with_same_name.name = @course.name.upcase
      course_with_same_name.save
    end

    it { should_not be_valid }
  end
  
end
