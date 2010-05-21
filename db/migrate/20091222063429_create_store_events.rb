class CreateStoreEvents < ActiveRecord::Migration
  def self.up
    create_table :store_events do |t|
      t.date :month
      t.integer :event_type
      t.text :content
      t.references :store
      t.timestamps
    end
  end

  def self.down
    drop_table :store_events
  end
end
