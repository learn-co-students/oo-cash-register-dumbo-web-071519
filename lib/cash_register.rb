require "pry"
class CashRegister
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @last_transaction = 0
    end
    
    attr_accessor :discount, :total
    
    def add_item(item_name, price, quantaty = 1)
        @last_transaction = @total
        @total += (price * quantaty)  
        amount_of_items = [item_name] * quantaty
        @items += amount_of_items


    end

    def apply_discount
        if @discount != 0
            discount_off = ((100 - @discount).to_f / 100)
            @total = (@total * discount_off).to_i
            @total
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        # binding.pry
        @items
    end

    def void_last_transaction
        @total = @last_transaction.to_f
        #binding.pry
    end
end