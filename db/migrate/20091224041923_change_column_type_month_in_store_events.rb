class ChangeColumnTypeMonthInStoreEvents < ActiveRecord::Migration
  def self.up
    change_column :store_events, :month, :integer
  end

  def self.down
    change_column :store_events, :month, :date
  end
end