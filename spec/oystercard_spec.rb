require 'oystercard'

describe Oystercard do
    before :each do
        @card = Oystercard.new(5)
    end
    describe '#check_balance' do
        it 'returns the current balance' do
            expect(@card.balance).to eq 5
        end
    end
    describe '#top_up' do
        context 'when the amount will not push the balance above the card limit' do
            it 'adds money to balance' do
                @card.top_up(3)
                expect(@card.balance).to eq 8
            end
        end
        context 'when the amount will not push the balance above the card limit' do
            it 'adds money to balance' do
                expect{@card.top_up(90)}.to raise_error(/Maximum balance exceeded!/)
            end
        end
    end
    describe '#deduct' do
        it 'deducts money from the balance' do
            @card.deduct(2)
            expect(@card.balance).to eq 3
        end
    end
end