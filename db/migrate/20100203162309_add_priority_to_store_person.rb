class AddPriorityToStorePerson < ActiveRecord::Migration
  def self.up
    add_column :store_people, :priority, :integer
  end

  def self.down
    remove_column :store_people, :priority
  end
end