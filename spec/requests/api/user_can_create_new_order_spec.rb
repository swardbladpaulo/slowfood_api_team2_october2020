RSpec.describe Api::OrdersController, type: :request do
  let!(:product_1) { create(:product, name: 'Swedish Meatballs') }
  let!(:product_2) { create(:product, name: 'Reindeer Tartare') }
  let!(:registered_user) { create(:user) }
  let!(:authorization_headers) { registered_user.create_new_auth_token }

  before do
    post '/api/orders', 
      params: { product_id: product_1.id },
      headers: authorization_headers
  end

  it {
    expect(response).to have_http_status 200
  }

  it 'is expected to respond with a success message' do
    expect(JSON.parse(response.body)['message'])
    .to eq 'Product was successfully added to your order!'
  end
end