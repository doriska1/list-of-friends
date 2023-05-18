# frozen_string_literal: true

Rails.application.routes.draw do
  root 'friends#index'
  resources :friends do
    collection do
      get :school
      get :work
      get :college
      get :childhood
    end
  end
end
