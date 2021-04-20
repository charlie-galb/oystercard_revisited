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
        it 'adds money to balance' do
            @card.top_up(3)
            expect(@card.balance).to eq 8
        end
    end
end