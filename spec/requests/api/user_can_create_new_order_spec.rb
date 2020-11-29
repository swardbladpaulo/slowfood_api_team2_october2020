RSpec.describe Api::OrdersController, type: :request do
  let!(:product_1) { create(:product, name: 'Swedish Meatballs', price: 10) }
  let!(:product_2) { create(:product, name: 'Reindeer Tartare', price: 15) }
  #let!(:registered_user) { create(:user) }
  #let!(:authorization_headers) { registered_user.create_new_auth_token }

  before do
    post '/api/orders', 
      params: { product_id: product_1.id }
      order_id = JSON.parse(response.body)["order"]["id"]
      @order = Order.find(order_id)
  end

  describe 'POST/api/orders' do
    it {
      expect(response).to have_http_status 200
    }

    it 'is expected to respond with a success message' do
      expect(JSON.parse(response.body)['message'])
      .to eq 'Product was successfully added to your order!'
    end

    it 'responds with order id' do
      expect(JSON.parse(response.body)["order"]["id"]).to eq @order.id
    end

    it 'responds with right amount of products' do
      expect(JSON.parse(response.body)["order"]["products"].count).to eq 1
    end

    it 'responds with right order total price' do
      expect(JSON.parse(response.body)["order"]["total"]).to eq 10
    end
  end

  describe 'PUT/api/orders/:id' do
    before do
      put "/api/orders/#{@order.id}", params: {product_id: product_2.id}
      put "/api/orders/#{@order.id}", params: {product_id: product_2.id}
    end

    it 'adds another product to order if request is a PUT and param id of the order is present' do
      expect(@order.order_items.count).to eq 3
    end

    it 'responds with order id' do
      expect(JSON.parse(response.body)["order"]["id"]).to eq @order.id
    end

    it 'responds with right amount of unique products' do
      expect(JSON.parse(response.body)["order"]["products"].count).to eq 2
    end

    it 'responds with right order total price' do
      expect(JSON.parse(response.body)["order"]["total"]).to eq 40
    end
  end
end
