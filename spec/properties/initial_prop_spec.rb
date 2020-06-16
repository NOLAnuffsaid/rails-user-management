require 'faker'
require 'rantly/rspec_extensions'

RSpec.describe 'A property' do
  it 'apps should have properties' do
    prop = property_of {
      Rantly do
        dict(3) do
          [
            [:username, Faker::Internet.username],
            [:password, string(:alnum)],
            [:email, Faker::Internet.email]
          ][call([:range, 0, 2])]
        end
      end
    }

    prop.check(1000) do |b|
      regex = %r{[a-zA-Z0-9_\-.]+@[a-zA-Z0-9]+.[a-zA-Z0-9]+}
      expect(b[:username]).to be_an_instance_of(String)
      expect(b[:email]).to match(regex)
    end
  end
end
