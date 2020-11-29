class Api::OrdersController < ApplicationController
  #before_action :authenticate_user!
  def create
    order = Order.create
    order.order_items.create(product_id: params[:product_id])
    render json: { message: 'Product was successfully added to your order!', order_id: order.id }
  end

  def update
    order = Order.find(params[:id])
    product = Product.find(params[:product_id])
    order.order_items.create(product: product)
    render json: {message: 'Updated Product was successfully added to your order!', order_id: order.id}
  end
end
