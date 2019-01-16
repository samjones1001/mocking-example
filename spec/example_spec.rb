require 'example'

describe Bike do
  let(:bike) { described_class.new }

  it 'is working at initialization' do
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
  let(:station)       { DockingStation.new }

  it 'is empty at initialization' do
    expect(station.bikes).to be_empty
  end

  describe '#dock' do
    it 'stores the bike' do
      bike = Bike.new
      station.dock(bike)
      expect(station.bikes).to include(bike)
    end
  end

  describe '#release' do
    it 'releases working bikes' do
      bike = Bike.new
      station.dock(bike)
      expect(station.release).to eq(bike)
    end

    it 'raises an error if the bike is broken' do
      bike = Bike.new
      bike.report_broken
      station.dock(bike)
      expect{ station.release }.to raise_error 'bike broken!'
    end
  end
end
