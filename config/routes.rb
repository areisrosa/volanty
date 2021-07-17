Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      namespace :cav do
        resources :inspetion, shallow: true, except: %i[show update]
        resources :visit, shallow: true, except: %i[show update]
      end

      resources :status, only: :index
    end
  end
end
