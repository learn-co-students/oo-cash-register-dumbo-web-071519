class CashRegister

  attr_accessor :total, :discount, :items, :last

  def initialize(e_discount = 0)
    @total = 0
    @discount = e_discount
    @items = []
  end

  def total
    @total
  end

  def add_item(title, price, qty = 1)
    qty.times { self.items << title }
    self.total += price * qty
    self.last = price * qty
  end

  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    end

    self.total = self.total - (self.total * (self.discount / 100.0))
    p "After the discount, the total comes to $#{self.total.to_i}."
  end

  def void_last_transaction
    self.total -= self.last
  end

end
