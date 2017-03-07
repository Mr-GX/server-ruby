class CreateCourseLecturerJoinTable < ActiveRecord::Migration[5.0]
  create_join_table :courses, :lecturers do |t|
  	t.index :course_id
  	t.index :lecturer_id
  end
end
