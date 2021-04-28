class Order
  def initialize(big_commerce_order)
    @id = big_commerce_order.id
    @date_created = DateTime.rfc2822(big_commerce_order.date_created)
    @product_count = Bigcommerce::OrderProduct.count(@id).count
    @total_inc_tax = big_commerce_order.total_inc_tax.to_f
  end

  attr_reader :id
  attr_reader :date_created
  attr_reader :product_count
  attr_reader :total_inc_tax

  def self.get_orders(customer_id)
    Bigcommerce::Order.all(customer_id: customer_id)
  end
end
