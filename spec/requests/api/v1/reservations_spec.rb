require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
 
  path '/api/v1/{username}/reservations' do
    # You'll want to customize the parameter types...
    parameter name: 'username', in: :path, type: :string, description: 'username'

    get('list reservations') do
      response(200, 'successful') do
        let(:username) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create reservation') do
      response(200, 'successful') do
        let(:username) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/{username}/reservations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'username', in: :path, type: :string, description: 'username'
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    delete('delete reservation') do
      response(200, 'successful') do
        let(:username) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
