RSpec.describe Api::OrdersController, type: :request do
  let!(:product_1) { create(:product, name: 'Swedish Meatballs') }
  let!(:product_2) { create(:product, name: 'Reindeer Tartare') }
  #let!(:registered_user) { create(:user) }
  #let!(:authorization_headers) { registered_user.create_new_auth_token }

  before do
    post '/api/orders', 
      params: { product_id: product_1.id }
      @order_id = JSON.parse(response.body)['order_id']
  end

  describe 'POST/api/orders'do
    it 'is expected to respond with a success message' do
      expect(JSON.parse(response.body)['message'])
      .to eq 'Product was successfully added to your order!'
    end

    it 'responds with order id' do
      order = Order.find(@order_id)
      expect(JSON.parse(response.body)['order_id']).to eq order.id
    end
  
    it {
      expect(response).to have_http_status 200
    }
    end

  describe 'PUT/api/orders/:id'do
    before do
      put "/api/orders/#{@order_id}", params: {product_id: product_2.id}
      @order = Order.find(@order_id)
    end

    it 'adds another product to order if param "order_id" is present' do
      expect(@order.order_items.count).to eq 2
    end

    it 'responds with order id' do
      expect(JSON.parse(response.body)['order_id']).to eq @order.id
    end
  end
end
