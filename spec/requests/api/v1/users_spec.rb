require 'swagger_helper'

describe 'Users API' do
  path '/api/v1/users' do
    post 'Create a user' do
      tags 'Users SignUp'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string }
        },
        required: %w[username]
      }

      response '200', 'User Created' do
        let!(:user) { { username: 'anotherNewName' } }
        run_test!
      end

      response '400', 'Invalid username' do
        let(:user) { {} }
        run_test!
      end
    end
  end
end
