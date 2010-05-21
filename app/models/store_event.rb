class StoreEvent < ActiveRecord::Base
  belongs_to :store
  
  validates_presence_of :store, :event_type
  
  MONTHLY = 1
  ONGOING = 2
  SPECIAL = 3
  SAVE_THE_DATE = 4

  def self.find_by_key(keyword)
    conditions = []
    conditions << "store_id = #{keyword.store}" unless keyword.store.blank?
    conditions << "event_type = #{keyword.event_type}" unless keyword.event_type.blank?
    conditions = conditions.empty? ? nil : conditions.join(" AND ")
    find(:all, :conditions => conditions, :order => "happens_at ASC")
  end

  def event_type_name
    case event_type
    when StoreEvent::MONTHLY
      return "Monthly"
    when StoreEvent::ONGOING
      return "Ongoing"
    when StoreEvent::SPECIAL
      return "Special"
    when StoreEvent::SAVE_THE_DATE
      return "Save The Date"
    else return "No Event Type Selected"
    end
  end
  
end
