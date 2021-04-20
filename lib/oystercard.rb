class Oystercard
    attr_reader :balance

    MAX_LIMIT = 90

    def initialize(balance)
        @balance = balance
    end

    def top_up(amount)
        fail_if_max_exceeded(amount)
        @balance += amount
    end

    def deduct(amount)
        @balance -= amount
    end

    private 

    def fail_if_max_exceeded(increase)
        raise "Maximum balance exceeded!" if increase + @balance > MAX_LIMIT
    end
    
end