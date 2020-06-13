require 'faker'
require 'httparty'
require 'uri'
require 'json'

Given('a feature file is created') do
  @file = Faker::File.file_name(dir: 'features', ext: 'feature')
end

When('I run BDD tests') do
  puts 'BDD tests exec!'
end

Then('I should see results for that file') do
  expect(@file).to end_with 'feature'
end

Given('an unknown route') do
  slug = Faker::Lorem.words(number: rand(5)).join(' ')
  @route = "/#{Faker::Internet.slug(words: slug, glue: '/')}"
end

When('a request is made') do
  @response = HTTParty.get("http://localhost:3000/#{@route}")
end

Then('the user receives an error response') do
  json_hash = {
    error: :not_found,
    message: "Invalid route: #{@route[1..]}",
    path: @route[1..]
  }

  error_response = JSON.generate(json_hash)

  expect(@response.body).to eq error_response
end
