Rails.application.routes.draw do
  resources :colaborators do
    member do
      get "preview"  # crea la ruta colaborator/3/preview para cada elemento en la base de datos, lo asocia al método "preview"
    end

    collection do
      get "search"  # crea la ruta colaborators/search para buscar colaboradores en la base de datos, con el método "search"
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "colaborators#index"
end
