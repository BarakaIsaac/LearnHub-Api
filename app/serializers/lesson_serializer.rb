class LessonSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :course_id
end
