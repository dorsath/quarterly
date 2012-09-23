Whenever::Application.routes.draw do
  resources :projects do
    resources :stories do
      member do
        get :start
      end
    end
  end

  resources :dashboards

  root to: "dashboards#index"
end
