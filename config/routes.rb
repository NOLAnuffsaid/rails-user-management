Rails.application.routes.draw do
  scope '/api' do
    scope '/v1' do
      post '/users', to: 'graphql#execute'

      get '/health-check', to: 'system#health'
    end
  end

  mount Raddocs::App => '/docs'

  match '*path' => 'error#not_found', via: %i[get post]
end
