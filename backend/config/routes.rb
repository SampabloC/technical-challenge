# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
      scope 'repos' do
        get '/list', to: 'repositories#index'
        get '/search', to: 'repositories#search_repository'
      end
    end
  end
end
