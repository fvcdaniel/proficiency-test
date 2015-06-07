# == Schema Information
#
# Table name: classrooms
#
#  id         :integer          not null, primary key
#  student_id :integer
#  course_id  :integer
#  entry_at   :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
end
