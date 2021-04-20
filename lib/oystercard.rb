class Oystercard
    attr_reader :balance, :travel_history

    MAX_BALANCE = 90
    MIN_BALANCE = 1
    STANDARD_FARE = 1


    def initialize(balance)
        @balance = balance
        @in_journey = false
        @entry_station = nil
        @travel_history = []
    end

    def top_up(amount)
        fail_if_max_exceeded(amount)
        @balance += amount
    end

    def in_journey?
        if @travel_history[0] && @travel_history[0].length == 1
            true
        else
            false
        end
    end

    def touch_in(entry_station)
        fail_if_below_min
        @in_journey = true
        @travel_history << {entry: entry_station}
    end

    def touch_out(exit_station)
        @in_journey = false
        deduct
        @travel_history[0][:exit] = exit_station
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