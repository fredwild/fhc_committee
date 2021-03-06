ActionController::Routing::Routes.draw do |map|

  map.connect ':controller/:id/related/:relname', :action => 'get_related'
  map.connect ':controller/:id/related/:relname.:format', :action => 'get_related'

  map.connect ':controller/:id/related', :action => 'related'
  map.connect ':controller/:id/related.:format', :action => 'related'

  map.connect ':controller/:action/:id', :action => /\D+/
  map.resources :months
  map.resources :documents
  map.resources :events
  map.resources :announcements
  map.resources :volunteers
  map.resources :meetings
  map.resources :task_objs
  map.resources :committees
  map.resources :website_functions
  map.resources :committee_roles
  map.resources :role_assignments
  map.resources :resources

  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

# BEGIN-UID.userroutes

# END-UID.userroutes

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  # map.connect '', :controller => "welcome"
  map.connect '', :controller => 'index', :action => 'index'

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

end
