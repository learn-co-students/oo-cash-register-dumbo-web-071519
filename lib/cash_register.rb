class CashRegister

  attr_reader :discount
  attr_accessor :total

  def initialize(discount = nil)
    @total = 0
    @discount = discount
  end

  def add_item(item, price, quantity = 1)
    @total += (price * quantity)
    @all_items ||= []
    quantity.times { @all_items << item }
    @last_item_purchased = {item: price.to_f}
  end

  def apply_discount
    if discount
      @total *= (1.00 - discount.to_f/100)
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @all_items
  end

  def void_last_transaction
    @total -= @last_item_purchased[:item]
  end 

end
