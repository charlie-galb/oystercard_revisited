require 'station'

describe Station do 
    it 'knows its name' do
        station = Station.new('High Barnet', 5)
        expect(station.name).to eq 'High Barnet'
    end
    it 'knows its zone' do
        station = Station.new('High Barnet', 5)
        expect(station.zone).to eq 5
    end
end