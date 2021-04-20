require 'oystercard'

describe Oystercard do

    let(:barnet_station) {double('fake entry station', :name => 'High Barnet', :zone => 5)}
    let(:brixton_station) {double('fake exit station', :name => 'Brixton', :zone => 2)}

    before :each do
        @card = Oystercard.new(0)
    end

    describe '#check_balance' do
        it 'returns the current balance' do
            expect(@card.balance).to eq 0
        end
    end
    describe '#top_up' do
        context 'when the amount will not push the balance above the card limit' do
            it 'adds money to balance' do
                @card.top_up(3)
                expect(@card.balance).to eq 3
            end
        end
        context 'when the amount will not push the balance above the card limit' do
            it 'adds money to balance' do
                expect{@card.top_up(95)}.to raise_error(/Maximum balance exceeded!/)
            end
        end
    end
    describe '#touch_in' do
        context 'when there is insufficient balance on the card' do
            it 'raises an error' do
                expect{@card.touch_in(barnet_station)}.to raise_error(/Insufficient balance on card!/)
            end
        end
        context 'when the user has forgotten to touch out' do
            it 'deducts the penalty fare from the balance' do
                @card.top_up(20)
                @card.touch_in(barnet_station)
                expect {@card.touch_in(brixton_station)}.to change{@card.balance}.by(-6)
            end
        end
    end
    describe '#touch_out' do
        it 'deducts the correct fare from the balance' do
            @card.top_up(5)
            @card.touch_in(barnet_station)
            expect {@card.touch_out(brixton_station)}.to change{@card.balance}.by(-1)
        end
        context 'when the user has forgotten to touch in' do
            it 'deducts the penalty fare from the balance' do
                expect {@card.touch_out(brixton_station)}.to change{@card.balance}.by(-6)
            end
        end
    end
end