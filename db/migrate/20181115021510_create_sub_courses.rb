class CreateSubCourses < ActiveRecord::Migration
  def change
    create_table :sub_courses do |t|
      t.string :title, index: true
      t.string :cover_image_id
      t.text :description
      t.text :preview_description
      t.decimal :base_price, null: false, default: 0.0
      t.boolean :sell_alone, default: false
      t.string :slug
      t.integer :course_type
      t.integer :browser_count
      t.boolean :deleted, :default => false
      t.string :video_id
      t.timestamps
    end
    add_index :sub_courses, :slug, unique: true
  end
end
