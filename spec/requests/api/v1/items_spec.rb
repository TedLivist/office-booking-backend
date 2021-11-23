require 'swagger_helper'

RSpec.describe 'api/v1/items', type: :request do
  include ApiHelper

  path '/api/v1/items' do
    get('list items') do
      tags 'Items'
      produces 'application/json'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string, description: 'Bearer Token'

      response(200, 'OK') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   location: { type: :string },
                   description: { type: :string },
                   image: { type: :string },
                   created_at: { type: :string },
                   updated_at: { type: :string }
                 }
               }
        let(:Authorization) { authenticated_header(user: create(:user)) }
        let(:item) { create(:item) }
        run_test!
      end
    end

    post('create item') do
      tags 'Items'
      produces 'application/json'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string, description: 'Bearer Token'
      parameter name: :item,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    name: { type: :string },
                    location: { type: :string },
                    image: { type: :string },
                    description: { type: :string }
                  },
                  required: %w[name location image description]
                }

      response(201, 'Item Created') do
        let(:Authorization) { authenticated_header(user: create(:user)) }
        let(:item) { create(:item) }
        run_test!
      end
    end
  end

  path '/api/v1/items/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show item') do
      tags 'Items'
      produces 'application/json'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string, description: 'Bearer Token'

      response(200, 'Item Found') do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 location: { type: :string },
                 description: { type: :string },
                 image: { type: :string },
                 created_at: { type: :string },
                 updated_at: { type: :string }
               },
               required: %w[id]
        let(:user) { create(:user) }
        let(:Authorization) { authenticated_header(user: user) }
        let(:id) { create(:item).id }
        run_test!
      end
    end

    delete('delete item') do
      tags 'Items'
      produces 'application/json'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string, description: 'Bearer Token'

      response(200, 'Item Deleted') do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 location: { type: :string },
                 description: { type: :string },
                 image: { type: :string },
                 created_at: { type: :string },
                 updated_at: { type: :string }
               },
               required: %w[id]
        let(:Authorization) { authenticated_header(user: create(:user)) }
        let(:id) { create(:item).id }
        run_test!
      end
    end
  end
end
