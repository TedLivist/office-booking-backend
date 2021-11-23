require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  include ApiHelper
  path '/api/v1/{username}/reservations' do
    user = User.create(username: 'lameck')
    item = Item.create(name: 'item1', description: 'item1 description', location: 'item1 location',
                       image: 'item1 image_url')
    parameter name: 'username', in: :path, type: :string, description: 'username'

    get('list reservations') do
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string, description: 'Bearer Token'
      response(200, 'successful') do
        let(:Authorization) { authenticated_header(user: user) }
        let(:username) { user.username }
        user.reservations.create(user_id: user.id, item_id: item.id, start_date: Date.today, end_date: Date.today + 1)
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
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string, description: 'Bearer Token'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          item_id: { type: :integer },
          start_date: { type: :string },
          end_date: { type: :string }
        },
        required: %i[item_id start_date end_date]
      }
      response(201, 'successful') do
        let(:Authorization) { authenticated_header(user: user) }
        let(:username) { user.username }
        let(:reservation) { { user_id: user.id, item_id: item.id, start_date: Date.today, end_date: Date.today + 1 } }
        run_test!
      end
    end

    delete('delete reservation') do
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string, description: 'Bearer Token'
      parameter name: :id, in: :path, type: :integer, description: 'reservation id'
      response(204, 'successful') do
        let(:Authorization) { authenticated_header(user: user) }
        let(:username) { user.username }
        let(:id) do
          user.reservations.create(user_id: user.id, item_id: item.id, start_date: Date.today,
                                   end_date: Date.today + 1).id
        end
        run_test!
      end
    end
  end
end
