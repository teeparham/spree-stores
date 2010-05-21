class SetupPermalinks < ActiveRecord::Migration
  def self.up
    remove_column :stores, :url
    add_column :stores, :permalink, :string

    Store.reset_column_information

    Store.all.each do |store|
      store.set_permalink
      store.save!
    end
  end

  def self.down
    remove_column :stores, :permalink
    add_column :stores, :url, :string
  end
end