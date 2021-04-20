require 'journey'

describe Journey do

    let(:barnet_station) {double('fake entry station', :name => 'High Barnet', :zone => 5)}
    let(:brixton_station) {double('fake exit station', :name => 'Brixton', :zone => 2)}

    describe '#entry_station' do
        it 'knows its entry station' do
            subject.log_entry(barnet_station)
            expect(subject.entry_station).to eq barnet_station
        end
    end
    describe '#exit_station' do
        it 'knows its exit_station' do
            subject.log_exit(brixton_station)
            expect(subject.exit_station).to eq brixton_station
        end
    end
    describe '#fare' do
        context 'when there is no exit station' do
            it 'charges the penalty fare' do
                subject.log_entry(barnet_station)
                expect(subject.fare).to eq 6
            end
        end
    end
end