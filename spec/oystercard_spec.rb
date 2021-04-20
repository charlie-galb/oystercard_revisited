require 'oystercard'

describe Oystercard do
    describe '#check_balance' do
        it 'returns the current balance' do
            card = Oystercard.new(5)
            expect(card.balance).to eq 5
        end
    end
end