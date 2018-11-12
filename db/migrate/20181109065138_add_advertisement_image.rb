class AddAdvertisementImage < ActiveRecord::Migration
  def change
    create_table :advertisement_images do |t|
      t.string :image_id
    end
  end
end
