class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :course_id
      t.integer :base_amount, :null => false, :default => 0
      t.integer :quantity

      t.timestamps
    end
  end
end
