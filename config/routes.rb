ActionController::Routing::Routes.draw do |map|

  map.root :controller => "inicios", :action => "index"

  map.resource :user_session
  #map.root :controller => "user_sessions", :action => "new" # optional, this just sets the root route
  map.resource :account, :controller => "users"
  map.resources :users

  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.login 'login', :controller => 'user_sessions', :action => 'new'

  map.resources :inicios, :collection => { :uno => :get, :inicio => :get}

  map.resources :programas, :has_many => :fichas
  map.resources :fichas, :has_many => :aprendices
  map.resources :aprendices, :has_many => :practicas
  map.resources :practicas, :has_many => :academicos
  map.resources :practicas, :has_many => :alternativas
  map.resources :practicas, :has_many => :fortalezas
  map.resources :practicas, :has_many => :herramientas
  map.resources :aprendices
  map.resources :fichas
  map.resources :programas
  map.resources :especiales
  map.resources :herramientas
  map.resources :fortalezas
  map.resources :alternativas
  map.resources :academicos
  map.resources :practicas

  map.resources :docentes, :has_many => :lineas
  map.resources :docentes, :has_many => :formaciones
  map.resources :docentes, :has_many => :experiencias
  map.resources :docentes, :has_many => :publicaciones
  map.resources :docentes, :has_many => :dominios
  map.resources :docentes, :has_many => :prototipos
  map.resources :docentes, :has_many => :investigaciones
  map.resources :lineas
  map.resources :formaciones
  map.resources :investigaciones
  map.resources :experiencias
  map.resources :publicaciones
  map.resources :prototipos
  map.resources :areas
  map.resources :centros
  map.resources :cargos
  map.resources :ciudades
  map.resources :universidades
  map.resources :titulos
  map.resources :idiomas
  map.resources :paises
  map.resources :nacionalidades
  map.resources :dominios
  map.resources :docentes

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

end