class JourneyLog

    attr_reader :journeys, :current_fare

    def initialize(journey_class:)
        @current_fare = 0
        @journey_class = journey_class
        @journeys = []
    end

    def start(entry_station)
        current_journey.log_entry(entry_station)
        calculate_fare
    end

    def finish(exit_station)
        current_journey.log_exit(exit_station)
        calculate_fare
        journeys << current_journey
        current_journey = nil
    end

    def in_transit?
        current_journey.in_progress?
    end

    private 

    def current_journey
        @current_journey ||= @journey_class.new
    end

    def calculate_fare
        @current_fare = current_journey.fare
    end

end