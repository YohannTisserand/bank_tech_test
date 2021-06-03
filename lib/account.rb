require_relative 'transaction'
# require_relative 'printer'

class Account
  DEFAULT_BALANCE = 0
  attr_accessor :balance

  def initialize(transaction_class: Transaction)
    @balance = DEFAULT_BALANCE
    @transaction_class = transaction_class
    @transaction_history = []
  end

  def deposit(amount)
    check_low_deposit(amount)
    @balance += amount
    make_deposit(amount: amount, balance: @balance)
    @balance
  end

  def withdraw(amount)
    check_low_funds(amount)
    @balance -= amount
    make_withdraw(amount: amount, balance: @balance)
    @balance
  end

  def statement
    output = @transaction_history.reverse.map(&:print_logs).join("\n")
    print "date || credit || debit || balance\n"
    print output
  end

  private

  def check_low_funds(amount)
    raise "Not enough funds" unless @balance - amount >= DEFAULT_BALANCE
  end

  def check_low_deposit(amount)
    raise "must be at least £1" if amount == DEFAULT_BALANCE
  end

  def make_deposit(amount: nil, balance: nil)
    deposit = @transaction_class.new(amount: amount, balance: balance)
    @transaction_history.push(deposit)
  end
  
  def make_withdraw(amount: nil, balance: nil)
    withdraw = @transaction_class.new(amount: amount, balance: balance)
    @transaction_history.push(withdraw)
  end
end
