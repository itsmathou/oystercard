class Oystercard

attr_reader :balance, :MAXIMUM_BALANCE

MAXIMUM_BALANCE = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    fail "ERROR - Exceeds maximum balance of £#{MAXIMUM_BALANCE}" if @balance + amount >= MAXIMUM_BALANCE
    @balance += amount
  end

end
