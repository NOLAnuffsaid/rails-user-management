Rails.application.routes.draw do
  scope '/api' do
    scope '/v1' do
      post '/users', to: 'graphql#execute'
    end
  end

  mount Raddocs::App => '/docs'
end
