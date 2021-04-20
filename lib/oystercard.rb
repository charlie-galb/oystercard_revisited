require 'journey'
require 'station'

class Oystercard
    attr_reader :balance, :travel_history, :current_journey

    MAX_BALANCE = 90
    MIN_BALANCE = 1


    def initialize(balance)
        @balance = balance
        @current_journey = Journey.new
        @travel_history = []
    end

    def top_up(amount)
        fail_if_max_exceeded(amount)
        @balance += amount
    end

    def in_journey?
        @current_journey.in_progress?
    end

    def touch_in(entry_station)
        check_for_unfinished_journey
        fail_if_below_min
        @in_journey = true
        @current_journey = Journey.new
        @current_journey.log_entry(entry_station)
    end

    def touch_out(exit_station)
        @current_journey.log_exit(exit_station)
        deduct
        @travel_history << @current_journey
        @current_journey = Journey.new
    end

    private 

    def deduct
        @balance -= @current_journey.fare
    end

    def check_for_unfinished_journey
        deduct if @current_journey.entry_station
    end

    def fail_if_below_min
        raise "Insufficient balance on card!" if @balance < MIN_BALANCE
    end

    def fail_if_max_exceeded(increase)
        raise "Maximum balance exceeded!" if increase + @balance > MAX_BALANCE
    end
    
end