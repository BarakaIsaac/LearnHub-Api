class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :instructor, :creator_id, :rating
end
