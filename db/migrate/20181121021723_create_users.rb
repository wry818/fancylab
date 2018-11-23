class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :headimgurl
      t.string :openid
      t.timestamps
    end
  end
end
