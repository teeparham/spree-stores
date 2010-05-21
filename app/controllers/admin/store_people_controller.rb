class Admin::StorePeopleController < Admin::BaseController
  resource_controller
  
  [update, create].each do |action|
    action.wants.html {redirect_to collection_url}
  end
  
  def index
    @search = Search.new(params)
    @store_people = StorePerson.find_by_key(@search.key)
  end

  class Search
    attr_reader :key
    def initialize(param)
      @key = param[:store] rescue ""
    end
  end

end
