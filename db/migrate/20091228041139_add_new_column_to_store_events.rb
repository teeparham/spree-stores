class AddNewColumnToStoreEvents < ActiveRecord::Migration
  def self.up
    remove_column :store_events, :month
    add_column :store_events, :happens_at, :date
    add_column :store_events, :event_time, :string
  end

  def self.down
    add_column :store_events, :month, :integer
    remove_column :store_events, :happens_at
    remove_column :store_events, :event_time
  end
end