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

  def self.search(query)
    if query.empty?
      Student.all
    else
      students = Student.all.map do |x|
        if x.name.upcase.include?(query.upcase)
          x.name
        end
      end
      students = students.reject {|name| name.nil?}
      students
    end
  end



end
