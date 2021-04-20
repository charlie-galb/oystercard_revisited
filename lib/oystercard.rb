require 'journey'
require 'journey_log'
require 'station'

class Oystercard
    attr_reader :balance, :travel_history, :current_journey

    MAX_BALANCE = 90
    MIN_BALANCE = 1


    def initialize(balance)
        @balance = balance
        @travel_log = JourneyLog.new(journey_class: Journey)
    end

    def top_up(amount)
        fail_if_max_exceeded(amount)
        @balance += amount
    end

    def touch_in(entry_station)
        check_for_unfinished_journey
        fail_if_below_min
        @travel_log.start(entry_station)
    end

    def touch_out(exit_station)
        @travel_log.finish(exit_station)
        deduct
    end

    private 

    def deduct
        @balance -= @travel_log.current_fare
    end

    def check_for_unfinished_journey
        deduct if @travel_log.in_transit?
    end

    def fail_if_below_min
        raise "Insufficient balance on card!" if @balance < MIN_BALANCE
    end

    def fail_if_max_exceeded(increase)
        raise "Maximum balance exceeded!" if increase + @balance > MAX_BALANCE
    end
    
end