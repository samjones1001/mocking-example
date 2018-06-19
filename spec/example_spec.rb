require 'example'

describe Bike do
  let(:bike) { described_class.new }

  it 'is working when initialized' do
    expect(bike.working).to be(true)
  end

  describe '#report_broken' do
    it 'sets the bike to be broken' do
      bike.report_broken
      expect(bike.working).to be(false)
    end
  end
end

describe DockingStation do
  let(:station) { DockingStation.new }
  let(:bike)    { Bike.new }

  it 'is empty at initialization' do
    expect(station.bikes).to be_empty
  end

  describe '#dock' do
    it 'stores the bike' do
      station.dock(bike)
      expect(station.bikes).to include(bike)
    end
  end

  describe '#release' do
    it 'releases working bikes' do
      station.dock(bike)
      expect(station.release).to eq(bike)
    end

    it 'raises an error if the bike is broken' do
      bike.report_broken
      station.dock(bike)
      expect{ station.release }.to raise_error 'bike broken!'
    end
  end
end
