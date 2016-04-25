Rails.application.routes.draw do
  get 'notes' => 'notes#index'
  resources :notes
end
