class CreateStores < ActiveRecord::Migration
   def self.up
    create_table :stores do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end

  def self.down
    drop_table :stores
  end
end
