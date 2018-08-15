require 'station'

describe Station do
  subject(:oldst) { described_class.new(station, zone) }
  let(:station) { double :station }
  let(:zone) { double :zone }

  it 'receives two args on initialisation' do
    expect(oldst.station).to eq station
    expect(oldst.zone).to eq zone
  end
end
