BitiumCodeChallenge::Application.routes.draw do
  devise_for :users

  scope module: 'protected' do
    root to: 'apps#index', as: :apps
    patch '/update_apps', to: 'apps#update', as: :update_apps
  end

  root to: 'devise/sessions#new', as: :log_in
end
