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
    describe '#in_progress?' do
        context 'when there is an entry station but no exit station' do
            it 'returns true' do
                subject.log_entry(brixton_station)
                expect(subject.in_progress?).to eq true
            end
        end
        context 'when there is no entry station or exit station' do
            it 'returns false' do
                expect(subject.in_progress?).to eq false
            end
        end
        context 'when there is an exit station but no entry station' do
            it 'returns true' do
                subject.log_exit(brixton_station)
                expect(subject.in_progress?).to eq false
            end
        end
    end
    describe '#fare' do
        context 'when there is no exit station' do
            it 'charges the penalty fare' do
                subject.log_entry(barnet_station)
                expect(subject.fare).to eq 6
            end
        end
        context 'when there is no entry station' do
            it 'charges the penalty fare' do
                subject.log_exit(barnet_station)
                expect(subject.fare).to eq 6
            end
        end
        context 'when there is an entry station and an exit station' do
            it 'calculates the penalty based on zones crossed' do
                subject.log_entry(brixton_station)
                subject.log_exit(barnet_station)
                expect(subject.fare).to eq 4
                new_journey = Journey.new
                new_journey.log_entry(barnet_station)
                new_journey.log_exit(barnet_station)
                expect(new_journey.fare).to eq 1
            end
        end
    end
end
