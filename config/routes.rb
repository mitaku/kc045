Kc045::Application.routes.draw do

  namespace :settings do
    resource :profile, :only => [:show, :edit, :update, :destroy]
    resource :talk, :only => [:show, :edit, :update]
  end

  root :to => "welcome#index"

  resources "members", :only => [:index, :show]
  match '/auth/:provider/callback', :to => "sessions#callback"
  match '/logout', :to => "sessions#destroy"

end
