class Oystercard
    attr_reader :balance

    MAX_LIMIT = 90

    def initialize(balance)
        @balance = balance
    end

    def top_up(amount)
        raise "Maximum balance exceeded!" if amount + balance > MAX_LIMIT
        @balance += amount
    end
    
end