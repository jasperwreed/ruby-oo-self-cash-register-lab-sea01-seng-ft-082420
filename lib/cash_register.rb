require 'pry'

class CashRegister
    attr_accessor :discount, :total, :item_hash
    attr_reader :items
 
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @item_hash = {}
    end

    def add_item(title, price, quantity = 1)
        quantity.times {self.items << title}
        self.item_hash[:title] = title
        self.item_hash[:price] = price
        self.item_hash[:quantity] = quantity
        self.total += price * quantity
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total -= self.total * self.discount / 100
            "After the discount, the total comes to $800."
        end
    end

    def self.all
        @@all
    end

    def void_last_transaction
        self.total -= self.item_hash[:price] * self.item_hash[:quantity]
    end
end

