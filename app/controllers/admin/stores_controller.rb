class Admin::StoresController < Admin::BaseController
  resource_controller

#  before_filter :initialize_extension_partials

  [update, create].each do |action|
    action.wants.html {redirect_to collection_url}
  end
  
  def show
    @store = Store.find(params[:id]) 
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.icon_global_init( GIcon.new(:image =>
          "http://#{request.env['HTTP_HOST']}/images/marker_1.png",
        :icon_size => GSize.new(32,32),
        :icon_anchor => GPoint.new(9,32),
        :info_window_anchor => GPoint.new(9,2),
        :info_shadow_anchor =>
          GPoint.new(18,25)), "icon_source")
    icon_source = Variable.new("icon_source")
    @map.center_zoom_init([@store.latitude,@store.longitude],15)
    @map.overlay_init(GMarker.new([@store.latitude,@store.longitude],        
        :info_window =>@store.name, :icon => icon_source))
  end

  
end