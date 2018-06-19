class Bike
  attr_reader :working

  def initialize
    @working = true
  end

  def report_broken
    @working = false
  end
end

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def dock(bike)
    bikes.push(bike)
  end

  def release
    raise 'bike broken!' if !bikes.last.working
    bikes.pop
  end
end
