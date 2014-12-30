class Course < ActiveRecord::Base
  has_many :classrooms
  has_many :students, :through => :classrooms
  
  validates :name, presence: true, length: { minimum: 2 , maximum: 45}, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { minimum: 2 , maximum: 45}
  validates :status, inclusion: { in: [1,2],
    message: "%{value} não é um valor permitido." }, allow_nil: false
end
