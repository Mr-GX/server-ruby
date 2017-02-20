class AddCourseRefToLecturers < ActiveRecord::Migration[5.0]
  def change
    add_reference :lecturers, :course, foreign_key: true
  end
end
