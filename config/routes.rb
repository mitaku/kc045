Kc045::Application.routes.draw do
  root :to => "welcome#index"

  match '/auth/:provider/callback', :to => "sessions#callback"
  match '/logout', :to => "sessions#destroy"

end
