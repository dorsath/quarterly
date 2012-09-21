Whenever::Application.routes.draw do
  resources :projects
  root to: "dashboard#index"
end
