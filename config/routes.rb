Whenever::Application.routes.draw do
  resources :projects do
    resources :stories
  end

  resources :dashboards

  root to: "dashboards#index"
end
