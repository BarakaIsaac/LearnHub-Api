class AddVideoLinkToLessons < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :video_link, :string
  end
end
