require 'pry'

class CashRegister
attr_accessor :total
attr_reader :items, :discount


    def initialize(discount =nil)
        @total = 0
        @discount = discount
        @items = []
        @transactions = []
    end

    def add_item(title, price, quantity = 1)
        if !quantity
            quantity = 1
        end
        
        quantity.times do
            @items.push(title)
            @total += price
            transaction = []
            transaction.push(title, price)
            @transactions.push(transaction)
        end   
    end

    def apply_discount
        if self.discount
            @total = self.total - self.total * self.discount/100
             "After the discount, the total comes to $#{@total}."   
        else 
            return "There is no discount to apply."
        end
    end
    def void_last_transaction
        @items.pop
        @total = @total - @transactions.last[1]
    end


    
end
