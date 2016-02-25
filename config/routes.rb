BitiumCodeChallenge::Application.routes.draw do
  devise_for :users

  scope module: 'protected' do
    root to: 'dashboard#show', as: :dashboard
  end

  root to: 'devise/sessions#new', as: :log_in
end
