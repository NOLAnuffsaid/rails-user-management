module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
                               description: 'example field added by generator'
    def test_field
      'Hello World'
    end
  end
end
