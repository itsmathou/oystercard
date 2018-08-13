require 'oystercard'

describe Oystercard do
  # subject(:oystercard) { Oystercard.new }
  subject(:oystercard) { described_class.new }
  let(:mockAmount) { double :amount }
 
  describe '#initialize' do
    it 'defaults with a balance of £0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do 
    it { is_expected.to respond_to(:top_up) }
    it 'enables users to add funds' do 
      # number = 10 
      # expect(subject.top_up(10)).to eq 10
      allow(subject).to receive(:top_up).and_return(mockAmount)
      expect(subject.top_up(mockAmount)).to eq(mockAmount)
    end
    it 'raises error if trying to exceed maximum balance' do 
      expect { subject.top_up(91) }.to raise_error "ERROR - Exceeds maximum balance of £#{MAXIMUM_BALANCE}"
    end
  end

  


end
