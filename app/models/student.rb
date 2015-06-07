#encoding:utf-8
# == Schema Information
#
# Table name: students
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  register_number :string(255)
#  status          :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Student < ActiveRecord::Base
  has_many :classrooms
  has_many :courses, :through => :classrooms
  
  validates :name, presence: true, length: { minimum: 2 , maximum: 45}
  validates :register_number, numericality: { only_integer: true }, presence: true, uniqueness: true
  validates :status, inclusion: { in: [1,2],
    message: "%{value} não é um valor permitido." }, allow_nil: false
end
