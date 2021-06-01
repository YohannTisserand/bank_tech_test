class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    low_funds(amount)
    @balance -= amount
  end

  private

  def low_funds(amount)
    raise "Not enough funds" unless @balance - amount > 0
  end
end
