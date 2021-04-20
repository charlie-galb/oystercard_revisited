require 'journey'

describe Journey do

    let(:barnet_station) {double('fake entry station', :name => 'High Barnet', :zone => 5)}
    let(:brixton_station) {double('fake exit station', :name => 'Brixton', :zone => 2)}

    it 'knows its entry station' do
        journey = Journey.new(barnet_station)
        expect(journey.entry_station).to eq barnet_station
    end
end
