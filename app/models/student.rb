# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(student_name)
	if student_name.present?
      where('NAME like ?', "%#{student_name}%")
    else
      self.all
    end
  end
	
# alternative solution!:
	
#  def self.search(student_name)
#    students = []
#    self.all.each do |student|
#      if student.name.match(/#{student_name}/i)
#        students << student
#      end
#    end
#    students
#  end

end
