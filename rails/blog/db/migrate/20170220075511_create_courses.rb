class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.text :tag
      t.text :banner
      t.string :title
      t.string :sub_title
      t.text :desc

      t.timestamps
    end
  end
end
