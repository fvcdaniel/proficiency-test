# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  status      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Course < ActiveRecord::Base
  has_many :classrooms
  has_many :students, :through => :classrooms
  
  validates :name, presence: true, length: { minimum: 2 , maximum: 45}, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { minimum: 2 , maximum: 45}
  validates :status, inclusion: { in: [1,2],
    message: "%{value} não é um valor permitido." }, allow_nil: false
end
