# Put your extension routes here.

map.namespace :admin do |admin|        
 admin.resources :stores
 admin.resources :store_people, :collection => {:index => :any}
 admin.resources :store_events, :collection => {:index => :any}
end

map.resources :stores, :only => [:index]

map.connect '/stores/locate', :controller => :stores,       :action => :locate
map.connect '/stores/*path',  :controller => :stores,       :action => :show
map.connect '/staff/*path',   :controller => :store_people, :action => :show