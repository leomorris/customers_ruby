class Customer
  def initialize(big_commerce_customer)
    @id = big_commerce_customer.id
    @first_name = big_commerce_customer.first_name
    @last_name = big_commerce_customer.last_name
    @order_count = Bigcommerce::Order.count(customer_id: @id).count
  end

  attr_reader :id
  attr_reader :first_name
  attr_reader :last_name
  attr_reader :order_count

  def self.get_customers(page_number)
    Bigcommerce::Customer.all(page: page_number)
  end
end
