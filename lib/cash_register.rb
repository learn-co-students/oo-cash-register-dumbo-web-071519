class CashRegister
  attr_accessor :total, :discount, :items, :previous_total
  
  
  def initialize(discount =  0)
    @total = 0
    @discount = discount
    @items = []
    @previous_total = 0
  end
  
  def add_item(item,price, amount = 1)
    @total += price*amount
    @previous_total = @total - price
    @items.concat([item]*amount)
  end
  
  def apply_discount
    @discount == 0 ? "There is no discount to apply." : (@total = @total- (@total*@discount)/100
     "After the discount, the total comes to $#{@total}.")
  end
  
  def items 
    @items
  end
  
  def void_last_transaction
    @total = @previous_total
  end
end
