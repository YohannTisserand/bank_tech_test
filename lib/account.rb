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
    low_deposit(credit)
    @transaction_history << @balance += credit
  end

  def withdraw(debit)
    low_funds(debit)
    @transaction_history <<  @balance -= debit
  end

  private

  def low_funds(debit)
    raise "Not enough funds" unless @balance - debit >= DEFAULT_BALANCE
  end

  def low_deposit(credit)
    raise "must be at least £1" if credit == DEFAULT_BALANCE
  end
end
