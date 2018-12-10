Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
  resources :users do
    resources :interviews
    patch 'interviews/:id/apply', to: 'interviews#apply', as: :apply_interview
    post 'interviews/approve', to: 'interviews#approve', as: :approve_interviews
  end
end
