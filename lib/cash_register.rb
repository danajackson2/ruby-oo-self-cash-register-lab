require 'pry'
class CashRegister

    attr_accessor :total, :title, :items, :last_price, :last_quantity
    attr_reader :discount
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last_price = 0
        @last_quantity = 0
    end

    def add_item(title, price, quantity=1)
        @title = title 
        @total += price * quantity
        quantity.times{@items << title}
        @last_price = price
        @last_quantity = quantity
    end

    def apply_discount
        if @discount > 0
            @total -= @total*discount/100
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end  
    end

    def items
        @items
    end
    
    def void_last_transaction
        @total -= @last_price * @last_quantity    
    #     if @items[0...-@last_quantity] == []
    #         @total = 0.0
    #     end 
    end
end