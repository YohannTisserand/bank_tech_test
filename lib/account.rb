require_relative 'transaction'

class Account
  DEFAULT_BALANCE = 0
  attr_accessor :balance

  def initialize(transaction_class: Transaction)
    @balance = DEFAULT_BALANCE
    @transaction_class = transaction_class
    @transaction_history = []
  end

  def deposit(credit)
    check_low_deposit(credit)
    @balance += credit
    make_deposit(credit: credit, balance: @balance)
    current_balance_output
  end

  def withdraw(debit)
    check_low_funds(debit)
    @balance -= debit
    make_withdraw(debit: debit, balance: @balance)
    current_balance_output
  end

  def statement
    output = @transaction_history.reverse.map(&:print_logs).join("\n")
    print "date || credit || debit || balance\n"
    print output
  end

  private

  def check_low_funds(debit)
    raise "Not enough funds" unless @balance - debit >= DEFAULT_BALANCE
  end

  def check_low_deposit(credit)
    raise "must be at least £1" if credit == DEFAULT_BALANCE
  end

  def current_balance_output
    "You have £#{@balance} on your account"
  end

  def make_deposit(credit: nil, balance: nil)
    deposit = @transaction_class.new(credit: credit, balance: balance)
    @transaction_history.push(deposit)
  end
  
  def make_withdraw(debit: nil, balance: nil)
    withdraw = @transaction_class.new(debit: debit, balance: balance)
    @transaction_history.push(withdraw)
  end
end
