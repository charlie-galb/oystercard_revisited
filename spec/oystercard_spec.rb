require 'oystercard'

describe Oystercard do
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
    describe '#in_journey?' do
        context 'when the user is not in transit' do
            it 'returns false' do
                expect(@card.in_journey?).to eq false
            end
        end
    end
    describe '#touch_in' do
        context 'when the balance on the card is above the minimum fare' do
            it 'changes the in_journey status to true' do
                @card.top_up(3)
                @card.touch_in
                expect(@card.in_journey?).to eq true
            end
        end
        context 'when there is insufficient balance on the card' do
            it 'raises an error' do
                expect{@card.touch_in}.to raise_error(/Insufficient balance on card!/)
            end
        end
    end
    describe '#touch_out' do
        it 'changes the in_journey status to false' do
            @card.top_up(5)
            @card.touch_in
            expect(@card.in_journey?).to eq true
            @card.touch_out
            expect(@card.in_journey?).to eq false
        end
        it 'deducts the correct fare from the balance' do
            @card.top_up(5)
            @card.touch_in
            expect {@card.touch_out}.to change{@card.balance}.by(-1)
        end
    end
end