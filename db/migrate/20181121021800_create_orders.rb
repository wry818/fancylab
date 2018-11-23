class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      
      t.integer :user_id
      t.string  :transaction_id
      t.string  :out_trade_no
      t.integer :status

      t.timestamps
      
    end
  end
end
