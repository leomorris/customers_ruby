class CustomersController < ApplicationController

  def index
    @page = params[:page] ? params[:page].to_i : 1
    big_commerce_customers = Customer.get_customers(@page)
    @customers = Array.new
    big_commerce_customers.each do |big_commerce_customer|
      customer = Customer.new(big_commerce_customer)
      @customers << customer
    end
  end

  def show
    @customer_id = params[:id].to_i
    big_commerce_orders = Order.get_orders(@customer_id)
    @lifetime_value = 0
    @orders = Array.new
    big_commerce_orders.each do |big_commerce_order|
      order = Order.new(big_commerce_order)
      @lifetime_value += order.total_inc_tax
      @orders << order
    end
    @lifetime_value = @lifetime_value.round(2)
  end
end

