Rails.application.routes.draw do
  get '/', to: 'leagues#index'
  post 'leagues/create'
  get 'leagues/find'
end
