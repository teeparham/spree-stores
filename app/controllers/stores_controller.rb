class StoresController < Spree::BaseController
  def index
  end

  def show
    @store = Store.find_by_permalink(params[:path].join('/')+'/') if params[:path]
    @store ||= Store.find(params[:id].to_i) if params[:id] && params[:id].to_i > 0
    redirect_to :action => :index unless @store
  end

  def locate
    @stores = []
    info = "#{params[:city]} #{params[:state]} #{params[:zip]}"

    @location =  Geokit::Geocoders::GoogleGeocoder.geocode(info)

    if @location.success
      @stores = Store.find(:all,
                           :origin => [@location.lat, @location.lng],
                           :conditions => "distance < #{params[:search][:distance]}",
                           :units=>:miles,
                           :order=>'distance', :limit => 9)

      if @stores.empty?
        flash[:error] = "No stores were found near your location. Try expanding the distance."
        redirect_to :action => :index
      else
        @map = GMap.new("map_div")
        @map.control_init(:large_map => true, :map_type => true)
        marker_group = []

        @stores.each_with_index do |store, index|
          @map.icon_global_init( GIcon.new(:image =>
              "http://#{request.env['HTTP_HOST']}/images/marker_" + "#{index + 1}.png",
               :icon_size => GSize.new(32, 32),
               :icon_anchor => GPoint.new(9, 32),
               :info_window_anchor => GPoint.new(9, 2),
               :info_shadow_anchor => GPoint.new(18, 25)), "icon_source_#{index + 1}")
          
          icon_source = Variable.new("icon_source_#{index + 1}")
          
          marker_group << GMarker.new([store.latitude, store.longitude],
                                      :info_window => @template.info_window(store),
                                      :icon => icon_source)

        end

        @map.overlay_global_init(GMarkerGroup.new(true, marker_group), "store_markers")
        # zoom to the source
        radius_zoom = params[:search][:distance].to_i
        zoom =
                if radius_zoom >= 100 then 8
                elsif radius_zoom >= 50 then 9
                elsif radius_zoom >= 20 then 10
                elsif radius_zoom >= 10 then 11
                elsif radius_zoom >= 5 then 12
                else 13
                end

        if @stores.size > 0
          @map.center_zoom_init([@stores.first.latitude, @stores.first.longitude], zoom)
        else
          @map.center_zoom_init([@location.lat, @location.lng], zoom)
        end
      end
    else
      flash[:error] = "Could not find search location. Please try again."
      redirect_to :action => :index
    end

  end

end
