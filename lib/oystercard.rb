class Oystercard

attr_reader :balance, :in_journey, :entry_station, :exit_station

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 1

  def initialize(balance = 0, in_journey = false)
    @balance = balance
    @in_journey = in_journey
    @previous_trips = { }
  end

  def top_up(amount)
    fail "ERROR - Exceeds maximum balance of £#{MAXIMUM_BALANCE}" if @balance + amount >= MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "ERROR - No fund please top up!" if @balance < MINIMUM_BALANCE
    @in_journey = true
    @entry_station = station
    # @previous_trips[entry_station]
  end

  def touch_out(exit_station)
    deduct(MINIMUM_CHARGE)
    @in_journey = false
    @exit_station = exit_station
    @previous_trips[@entry_station] = exit_station
    @entry_station = nil
    @previous_trips
  end


  private

  def deduct(fare)
    @balance -= fare
  end

end
