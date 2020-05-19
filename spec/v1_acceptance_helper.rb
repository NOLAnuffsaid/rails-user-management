require 'rails_helper'
require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'

RspecApiDocumentation.configure do |config|
  config.format = :json
  config.curl_host = 'http://localhost:3000'
  config.api_name = 'User Management API'
  config.api_explanation = 'Manages user access and creation.'
end
