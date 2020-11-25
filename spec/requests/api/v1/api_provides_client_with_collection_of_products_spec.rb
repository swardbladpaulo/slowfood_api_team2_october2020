# frozen_string_literal: true

RSpec.describe Api::ProductsController, type: :request do
  let!(:products) { 2.times { create(:product) } }
  describe 'GET /product' do
    before do
      get '/api/products'
    end

    it 'is expected to return a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return two products' do
      expect(response_json['products'].count).to eq 2
    end
  end
end