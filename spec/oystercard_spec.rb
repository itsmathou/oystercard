require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }    # subject(:oystercard) { Oystercard.new }
  let(:mockAmount) { double :amount }
 
  describe '#initialize' do
    it 'defaults with a balance of £0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do 
    it { is_expected.to respond_to(:top_up) }
    it 'enables users to add funds' do 
      allow(subject).to receive(:top_up).and_return(mockAmount)  # number = 10 
      expect(subject.top_up(mockAmount)).to eq(mockAmount)       # expect(subject.top_up(10)).to eq 10
    end
    it 'raises error if trying to exceed maximum balance' do 
      expect { subject.top_up(Oystercard::MAXIMUM_BALANCE) }.to raise_error "ERROR - Exceeds maximum balance of £#{Oystercard::MAXIMUM_BALANCE}"
    end
  end

  describe '#deduct' do 

  end

  


end
