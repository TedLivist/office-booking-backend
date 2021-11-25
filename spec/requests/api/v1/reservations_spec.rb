# rubocop:disable Metrics/BlockLength
require 'swagger_helper'

RSpec.describe 'api/v1/users/{user_username}/reservations', type: :request do
  include ApiHelper

  path '/api/v1/users/{user_username}/reservations' do
    get('list reservations') do
      tags 'Reservations'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string, description: 'Bearer Token'
      parameter name: :user_username, in: :path, type: :string, description: 'user_username'
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      response(200, 'OK') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   user_id: { type: :integer },
                   item_id: { type: :integer },
                   start_date: { type: :string },
                   end_date: { type: :string },
                   created_at: { type: :string },
                   updated_at: { type: :string },
                   item: {
                     type: :object,
                     properties: {
                       id: { type: :integer },
                       name: { type: :string },
                       location: { type: :string },
                       image: { type: :string },
                       description: { type: :string },
                       created_at: { type: :string },
                       updated_at: { type: :string }
                     }
                   }
                 }
               }
        let(:Authorization) { authenticated_header(user: user) }
        let(:user_username) { user.username }
        user.reservations.create!(item_id: item.id, start_date: Date.today, end_date: Date.today + 1)
        run_test!
      end
    end

    post('create reservation') do
      tags 'Reservations'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string, description: 'Bearer Token'
      parameter name: :user_username, in: :path, type: :string, description: 'user_username'
      parameter name: :reservation,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    item_id: { type: :integer },
                    start_date: { type: :string },
                    end_date: { type: :string }
                  },
                  required: %w[item_id start_date end_date]
                }
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      response(200, 'Reservation Created') do
        let(:Authorization) { authenticated_header(user: user) }
        let(:user_username) { user.username }
        let(:reservation) { { item_id: item.id, start_date: Date.today, end_date: Date.today + 1 } }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_username}/reservations/{id}' do
    delete('delete reservation') do
      tags 'Reservations'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string, description: 'Bearer Token'
      parameter name: :id, in: :path, type: :integer, description: 'reservation id'
      parameter name: :user_username, in: :path, type: :string, description: 'user_username'
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      response(200, 'successful') do
        let(:Authorization) { authenticated_header(user: user) }
        let(:user_username) { user.username }
        let(:id) do
          user.reservations.create!(item_id: item.id, start_date: Date.today,
                                    end_date: Date.today + 1).id
        end
        run_test!
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
