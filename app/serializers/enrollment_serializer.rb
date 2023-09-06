class EnrollmentSerializer < ActiveModel::Serializer
  attributes :id, :student_id, :course_id, :created_at
end
