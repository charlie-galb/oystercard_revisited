class JourneyLog

    attr_reader :journeys

    def initialize(journey_class:)
        @journey_class = journey_class
        @journeys = []
    end

    def start(entry_station)
        current_journey.log_entry(entry_station)
    end

    def finish(exit_station)
        current_journey.log_exit(exit_station)
    end

    private 

    def current_journey
        journey = @journey_class.new
        journey
    end

end