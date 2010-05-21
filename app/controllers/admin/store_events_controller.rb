class Admin::StoreEventsController < Admin::BaseController
  resource_controller

  [update, create].each do |action|
    action.wants.html {redirect_to collection_url}
  end
  
  def index
    @search = Search.new(params)
    @store_events = StoreEvent.find_by_key(@search)
  end

  def edit
    @store_event = StoreEvent.find(params[:id])
  end

  
  class Search
    attr_reader :store, :event_type

    def initialize(param)
      @store = param[:store] rescue ""
      @event_type = param[:event_type] rescue ""
    end
  end

end
