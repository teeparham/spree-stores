class StorePerson < ActiveRecord::Base
  belongs_to :store
  validates_presence_of :name, :store
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def self.find_by_key(keyword)
    conditions = keyword.blank? ? nil : "store_id = #{keyword}"
    find(:all, :conditions => conditions, :order => "name ASC")
  end
end
