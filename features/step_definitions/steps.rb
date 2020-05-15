require 'faker'

Given('a feature file is created') do
  @file = Faker::File.file_name(dir: 'features', ext: 'feature')
end

When('I run BDD tests') do
  puts 'BDD tests exec!'
end

Then('I should see results for that file') do
  expect(@file).to end_with 'feature'
end
