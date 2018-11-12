class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :image_id
      t.string :introduction
      t.text :description
      t.decimal :base_price, null: false, default: 0.0
      t.integer :issue_count
      t.integer :subscriber_count
    end
  end
end
