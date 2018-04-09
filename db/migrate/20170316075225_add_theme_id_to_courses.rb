class AddThemeIdToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :theme_id, :integer
  end
end
