class CreateLecturers < ActiveRecord::Migration[5.0]
  def change
    create_table :lecturers do |t|
      t.text :avatar
      t.text :name
      t.text :desc

      t.timestamps
    end
  end
end
