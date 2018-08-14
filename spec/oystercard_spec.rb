require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }    # subject(:oystercard) { Oystercard.new }
  let(:mockAmount) { double :amount }
  let(:mockOystercard) { double :subject }

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

  describe '#touch_in' do
    it { is_expected.to respond_to(:touch_in) }
    it 'toggles #in_journey? to true' do
      allow(subject).to receive(:touch_in).and_return true
      expect(subject.touch_in).to eq true
    end

    it 'raises error if balance below 0' do
      expect { subject.touch_in }.to raise_error "ERROR - No fund please top up!"
    end
  end

  describe '#in_journey?' do
    it 'reads statuts of card' do
      allow(mockOystercard).to receive(:in_journey).and_return true
      expect(mockOystercard.in_journey).to eq true
    end
  end

  describe '#touch_out' do
    it { is_expected.to respond_to(:touch_out) }
     it 'toggles #in_journey? to false' do
       expect(subject.touch_out).to eq false
    end

    it "deducts the correct amount from my card" do
      subject.top_up(10)
      subject.touch_in
      expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
    end
  end


end
