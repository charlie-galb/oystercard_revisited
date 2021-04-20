class Oystercard
    attr_reader :balance

    MAX_BALANCE = 90
    MIN_BALANCE = 1


    def initialize(balance)
        @balance = balance
        @in_journey = false
    end

    def top_up(amount)
        fail_if_max_exceeded(amount)
        @balance += amount
    end

    def deduct(amount)
        @balance -= amount
    end

    def in_journey?
        @in_journey
    end

    def touch_in
        fail_if_below_min
        @in_journey = true
    end

    def touch_out
        @in_journey = false
    end

    private 

    def fail_if_max_exceeded(increase)
        raise "Maximum balance exceeded!" if increase + @balance > MAX_BALANCE
    end

    def fail_if_below_min
        raise "Insufficient balance on card!" if @balance < MIN_BALANCE
    end
    
end