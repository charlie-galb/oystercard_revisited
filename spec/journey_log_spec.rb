require 'journey_log'

describe JourneyLog do

    let(:barnet_station) {double('fake entry station', :name => 'High Barnet', :zone => 5)}
    let(:brixton_station) {double('fake exit station', :name => 'Brixton', :zone => 2)}
    let(:journey) {double('fake journey object', :log_entry => nil, :log_exit => nil, :fare => 0)}
    let(:mock_journey_class) {double('fake journey class', :new => journey)}

    before :each do
        @log = JourneyLog.new(journey_class: mock_journey_class)
    end

    describe '#journeys' do
        context 'when first initialized' do
            it 'returns an empty array' do
                expect(@log.journeys).to eq []
            end
        end
    end
    describe '#start' do
        it 'adds an entry_station to the current journey' do
            @log.start(barnet_station)
            expect(journey).to have_received(:log_entry).with(barnet_station)
        end
    end
    describe '#finish' do
        it 'adds an exit_station to the current journey and moves it to the journeys array' do
            @log.start(barnet_station)
            @log.finish(brixton_station)
            expect(journey).to have_received(:log_exit).with(brixton_station)
            expect(@log.journeys.length).to eq 1
        end
    end

end