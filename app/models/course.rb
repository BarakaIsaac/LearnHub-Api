class Course < ApplicationRecord
    validates :title, :description, :instructor, :creator_id, presence: true
end
