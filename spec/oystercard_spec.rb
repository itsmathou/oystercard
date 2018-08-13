require 'oystercard'
describe Oystercard do

  describe '#initialize' do
    it 'defaults with a balance of £0' do
      expect(subject.balance).to eq 0
    end
  end

end
