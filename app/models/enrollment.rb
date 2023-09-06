class Enrollment < ApplicationRecord
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :course

  validates :student_role
  ##
  private

  def student_role
    student = User.find(student_id)
    unless student && student.role == 'student'
      errors.add(:student_id, 'Only students can enroll in courses')
    end
  end
end
