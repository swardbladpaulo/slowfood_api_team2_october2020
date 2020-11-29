RSpec.describe Api::OrdersController, type: :request do
  let!(:product_1) { create(:product, name: 'Swedish Meatballs', price: 10) }
  let!(:product_2) { create(:product, name: 'Reindeer Tartate', price: 15) }
  # let(:order) { create(:order, :user) }
  # let(:registered_user) { create(:user) }
  let(:order) { create(:order) }

  before do
    order.order_items.create(product: product_1)
    order.order_items.create(product: product_2)
    
    put "/api/orders/#{order.id}", params: { activity: 'finalize' }
  end

  describe 'PUT /api/orders request' do
    it 'is expected to respond with a success message' do
      expect(JSON.parse(response.body)['message']).to eq 'Your order will be ready in 20 minutes'
    end

    it 'is expected to set the order attribute \'finalized\' to true' do
      expect(order.reload.finalized).to eq true 
    end
  end
end