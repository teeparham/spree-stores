class ChangeColumnEventType < ActiveRecord::Migration
  def self.up
    remove_column :store_events, :event_type
    add_column :store_events, :event_type, :integer
  end

  def self.down
    remove_column :store_events, :event_type
    add_column :store_events, :event_type, :integer
  end
end