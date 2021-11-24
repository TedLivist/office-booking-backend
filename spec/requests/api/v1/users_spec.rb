require 'swagger_helper'

describe 'Users API' do
  before :each do
    User.destroy_all
  end

  path '/api/v1/users' do
    post 'Create a user' do
      tags 'Users SignUp'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string }
        },
        required: ['username']
      }

      response '200', 'User Created' do
        schema type: :object,
               properties: {
                 user: { type: :string },
                 token: { type: :string }
               },
               required: %w[user token]
        # let!(:user) { User.create!(username: Faker::Name.name) }
        let!(:username) { 'usaf' }
        run_test!
      end

      response '400', 'Invalid username' do
        let(:user) { {} }
        run_test!
      end
    end
  end
end
