class RemoveThemeIdFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :theme_id, :integer
  end
end
