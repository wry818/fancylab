class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, index: true
      t.string :cover_image_id
      t.string :introduction
      t.text :description
      t.decimal :base_price, null: false, default: 0.0
      t.integer :issue_count
      t.integer :subscriber_count
      t.string :slug
      t.boolean :deleted, :default => false
      t.timestamps
    end
    add_index :courses, :slug, unique: true
  end
end
