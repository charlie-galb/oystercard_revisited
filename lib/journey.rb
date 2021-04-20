class Journey

    attr_reader :entry_station, :exit_station

    PENALTY_FARE = 6
    MINIMUM_FARE = 1
    
    def initialize
        @entry_station = nil
        @exit_station = nil
    end

    def log_entry(entry_station)
        @entry_station = entry_station
    end

    def log_exit(exit_station)
        @exit_station = exit_station
    end

    def fare
        @exit_station ? MINIMUM_FARE : PENALTY_FARE
    end

end