class AddNewColumnToStores < ActiveRecord::Migration
  def self.up
    add_column :stores, :details,:text
    add_column :stores, :attachment_file_name,    :string
    add_column :stores, :attachment_content_type, :string
    add_column :stores, :attachment_file_size,    :integer
    add_column :stores, :attachment_updated_at,   :datetime
    add_column :stores, :blurb, :text
  end

  def self.down
    remove_column :stores, :details
    remove_column :stores, :attachment_file_name
    remove_column :stores, :attachment_content_type
    remove_column :stores, :attachment_file_size
    remove_column :stores, :attachment_updated_at
    remove_column :stores, :blurb
  end
end