require 'rails_helper'

describe Student do

  before { @student = Student.new(name: "Joao da Mata", register_number: '1234567', status: 1) }

  subject { @student }

  it { should respond_to(:name) }
  it { should respond_to(:register_number) }
  it { should respond_to(:status) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @student.name = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @student.name = "a" * 46 }
    it { should_not be_valid }
  end
  
  describe "when status is different then [1,2]" do
    before { @student.status = 3 }
    it { should_not be_valid }
  end
  
  describe "when register_number is not a number" do
    before { @student.register_number = '2.888.999' }
    it { should_not be_valid }
  end
  
  describe "when register_number is already taken" do
    before do
      student_with_same_register_number = @student.dup
      student_with_same_register_number.save
    end

    it { should_not be_valid }
  end
  
end
