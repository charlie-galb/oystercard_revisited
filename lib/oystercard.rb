class Oystercard
    attr_reader :balance, :entry_station

    MAX_BALANCE = 90
    MIN_BALANCE = 1
    STANDARD_FARE = 1


    def initialize(balance)
        @balance = balance
        @in_journey = false
        @entry_station = nil
    end

    def top_up(amount)
        fail_if_max_exceeded(amount)
        @balance += amount
    end

    def in_journey?
        @entry_station ? true : false
    end

    def touch_in(entry_station)
        fail_if_below_min
        @in_journey = true
        @entry_station = entry_station.name
    end

    def touch_out
        @in_journey = false
        deduct
        @entry_station = nil
    end

    private 

    def deduct
        @balance -= STANDARD_FARE
    end

    def fail_if_below_min
        raise "Insufficient balance on card!" if @balance < MIN_BALANCE
    end

    def fail_if_max_exceeded(increase)
        raise "Maximum balance exceeded!" if increase + @balance > MAX_BALANCE
    end
    
end