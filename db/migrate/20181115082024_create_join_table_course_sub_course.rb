class CreateJoinTableCourseSubCourse < ActiveRecord::Migration
  def change
    create_join_table :courses, :sub_courses do |t|
      t.index [:course_id, :sub_course_id]
      t.index [:sub_course_id, :course_id]
      t.integer :browser_count
    end
  end
end
