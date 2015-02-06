Rails.application.routes.draw do
  root to: 'home#show'

  scope format: 'json' do
    resources :stories
  end
end
