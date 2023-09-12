class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.string :student_name
      t.string :course_name

      t.timestamps
    end
  end
end
