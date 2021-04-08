Rails.application.routes.draw do
  get '/', to: 'leagues#index'
  post 'leagues/new'
  get 'leagues/find'
end
