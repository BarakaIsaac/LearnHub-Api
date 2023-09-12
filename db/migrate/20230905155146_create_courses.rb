class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    begin
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :instructor
      t.integer :creator_id
      t.integer :rating

      t.timestamps
    end
    rescue
    end
  end
end
