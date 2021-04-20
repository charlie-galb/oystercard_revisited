require 'journey_log'

describe JourneyLog do

    let(:barnet_station) {double('fake entry station', :name => 'High Barnet', :zone => 5)}
    let(:brixton_station) {double('fake exit station', :name => 'Brixton', :zone => 2)}
    let(:journey) {double('fake journey object')}
    let(:journey_class) {double('fake journey class', :new => journey)}

    log = JourneyLog.new

    describe '#journeys' do
        context 'when first initialized' do
            it 'returns an empty array' do
                expect(log.journeys).to eq []
            end
        end
    end

end