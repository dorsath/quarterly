Whenever::Application.routes.draw do
  resources :projects do
    resources :stories
  end
  root to: "dashboard#index"
end
