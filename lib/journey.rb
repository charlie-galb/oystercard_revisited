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
        if (@exit_station && !@entry_station) || (!@exit_station && @entry_station)
            PENALTY_FARE
        else
            MINIMUM_FARE + (entry_station.zone - exit_station.zone).abs
        end
    end

    def in_progress?
        if @entry_station && !@exit_station
            true
        else
            false
        end
    end

end