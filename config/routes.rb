Rails.application.routes.draw do
  resources :notes do
    resources :items
  end
end
