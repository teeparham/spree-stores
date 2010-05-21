class Store < ActiveRecord::Base
  include Geokit::Mappable

  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  has_attached_file :attachment,  :styles => { :medium => "300x300>", :thumb => "80x80>" }
  has_attached_file :promo_image, :styles => { :medium => "300x300>", :thumb => "80x80>" }

  has_many :store_people, :order => :priority
  has_many :store_events

  has_many :ongoing_events,       :class_name => 'StoreEvent', :conditions => ['event_type = ?', StoreEvent::ONGOING]
  has_many :special_events,       :class_name => 'StoreEvent', :conditions => ['event_type = ?', StoreEvent::SPECIAL]
  has_many :save_the_date_events, :class_name => 'StoreEvent', :conditions => ['event_type = ?', StoreEvent::SAVE_THE_DATE]
  has_many :monthly_events,       :class_name => 'StoreEvent', :conditions => ['event_type = ?', StoreEvent::MONTHLY]

  before_save :set_lat_lon
  before_save :set_permalink

  validates_presence_of :name, :address1, :city, :state, :zip

  def this_month_events
    monthly_events_between_dates(Time.now.beginning_of_month.strftime('%Y-%m-%d'), Time.now.end_of_month.strftime('%Y-%m-%d'))
  end

  def next_month_events
    monthly_events_between_dates(Time.now.next_month.beginning_of_month.strftime('%Y-%m-%d'), Time.now.next_month.end_of_month.strftime('%Y-%m-%d'))
  end

  # creates permalink if one does not exist
  def set_permalink(options={})
    self.permalink = state.to_url + "/" + name.to_url + "/" if (self.permalink.blank? || options[:force])
  end

  def to_url
    "/stores/" + self.permalink
  end

  def to_param
    self.permalink || self.id.to_s
  end

  def address
    "#{self.address1},#{self.address2}, #{self.city}, #{self.state}, #{self.zip}"
  end

  def city_state_zip
    "#{self.city}, #{self.state}, #{self.zip}"
  end

  def set_lat_lon
    loc = Geokit::Geocoders::GoogleGeocoder.geocode("#{self.address1} #{self.city} #{self.state}")
    if loc.success
      self.latitude = loc.lat
      self.longitude = loc.lng
    end
  end

  private

  def monthly_events_between_dates(after_date, before_date)
    StoreEvent.all(:conditions => [
        "store_id = :id AND event_type = :event_type AND happens_at >= :after_date AND happens_at <= :before_date",
        { :id => self.id,
          :event_type => StoreEvent::MONTHLY,
          :after_date => after_date,
          :before_date => before_date }
      ], :order => :happens_at)
  end

end
