# frozen_string_literal: true

RSpec.describe Api::ProductsController, type: :request do
  let!(:products) { 2.times { create(:product) } }
  describe 'GET /product' do
    before do
      get '/api/products'
    end

    it 'shoud return a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'should return two products' do
      expect(JSON.parse(response.body)['products'].count).to eq 2
    end
  end
end