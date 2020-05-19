require 'v1_acceptance_helper'

# rubocop:disable Metrics/BlockLength
resource 'Users' do
  explanation <<-EX
  Users are managed through one route that
  accepts different types of requests
  EX

  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  post '/api/v1/users' do
    with_options scope: :data, with_example: true do
      parameter :email, 'Unique user identifier', required: true
      parameter :password, '************', required: true
      parameter :roles, 'Grants users access to protected data', required: true
      parameter :username, 'Custome identifier created by the user'
    end

    context 'queries' do
      example 'for single user' do
      end

      example 'for all users valid role' do
      end

      example 'for all users invalid role' do
      end
    end

    context 'mutations' do
      example 'for user creation' do
      end

      example 'for user password change' do
      end

      example 'for user info updates' do
      end

      example 'for user removal' do
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
