class AddStorePromoAndEventName < ActiveRecord::Migration
  def self.up
    add_column :store_events, :name, :string
    add_column :stores, :promo_text, :text
    add_column :stores, :promo_page_url, :string

    add_column :stores, :promo_image_file_name, :string
    add_column :stores, :promo_image_content_type, :string
    add_column :stores, :promo_image_file_size, :integer
    add_column :stores, :promo_image_updated_at, :datetime
  end

  def self.down
    remove_column :store_events, :name
    remove_column :stores, :promo_text
    remove_column :stores, :promo_page_url

    remove_column :stores, :promo_image_file_name
    remove_column :stores, :promo_image_content_type
    remove_column :stores, :promo_image_file_size
    remove_column :stores, :promo_image_updated_at
  end
end