Rails.application.routes.draw do
  resources :artists, only: [:show, :index] do
    resources :songs, only: [:show, :index]
end

resources :songs, only: [:index, :show, :new, :create, :edit, :delete]
end

#root 'songs#index'
#end
