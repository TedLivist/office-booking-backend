require 'swagger_helper'

RSpec.describe 'api/v1/items', type: :request do
  include ApiHelper

  path '/api/v1/items' do
    get('list items') do
      tags 'Items'
      produces 'application/json'
      security [Bearer: []]
      consumes 'application/json'
      parameter name: :Authorization, in: :header, type: :string, description: 'Bearer Token'

      response(200, 'OK') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   description: { type: :string },
                   image: { type: :string },
                   created_at: { type: :string },
                   updated_at: { type: :string }
                 }
               }
        let!(:user) { create(:user) }
        let(:Authorization) { authenticated_header(user: user) }
        let!(:item) { create(:item) }
        # after do |example|
        #   example.metadata[:response][:examples] =
        #     { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        # end
        run_test!
      end
    end

    #   post('create item') do
    #     tags 'Items'
    #     produces 'application/json'
    #     parameter name: :item,
    #               in: :body,
    #               schema: {
    #                 type: :object,
    #                 properties: {
    #                   name: { type: :string },
    #                   description: { type: :string },
    #                   image_url: { type: :string }
    #                 },
    #                 required: %w[name description image_url]
    #               }

    #     response(201, 'Created') do
    #       schema type: :object,
    #              properties: {
    #                id: { type: :integer },
    #                name: { type: :string },
    #                description: { type: :string },
    #                image: { type: :string },
    #                created_at: { type: :string },
    #                updated_at: { type: :string }
    #              }

    #       run_test!
    #     end
    #   end
    # end

    # path '/api/v1/items/{id}' do
    #   parameter name: 'id', in: :path, type: :string, description: 'id'

    #   get('show item') do
    #     tags 'Items'
    #     produces 'application/json'

    #     response(200, 'OK') do
    #       schema type: :object,
    #              properties: {
    #                id: { type: :integer },
    #                name: { type: :string },
    #                description: { type: :string },
    #                image: { type: :string },
    #                created_at: { type: :string },
    #                updated_at: { type: :string }
    #              }

    #       run_test!
    #     end
    #   end

    #   delete('delete item') do
    #   end
  end
end
