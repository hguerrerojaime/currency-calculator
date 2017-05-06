Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/user/:id', to: 'user#get'
  post '/user', to: 'user#register'
  put '/user/:id/renew', to: 'user#renew'
  post '/calculate', to: 'calculator#calculate_rate'

end
