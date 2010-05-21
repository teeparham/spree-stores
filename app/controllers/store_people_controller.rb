class StorePeopleController < Spree::BaseController

  def show
    @store = Store.find_by_permalink(params[:path].join('/') + '/') if params[:path]
    @store ||= Store.find(params[:id].to_i) if params[:id] && params[:id].to_i > 0
    @staff = @store.store_people if @store
    redirect_to '/stores' unless @store
  end

end
