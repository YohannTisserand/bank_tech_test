require_relative 'transaction'

class Account
  DEFAULT_BALANCE = 0
  attr_accessor :balance

  def initialize( balance = DEFAULT_BALANCE, transaction_class: Transaction)
    @balance = balance
    @transaction_class = transaction_class
    @transaction_history = []
  end

  def deposit(credit)
    @transaction_history << @balance += credit
  end

  def withdraw(debit)
    low_funds(debit)
    @transaction_history <<  @balance -= debit
  end

  def header
    'date || credit || debit || balance'
  end

  private

  def low_funds(debit)
    raise "Not enough funds" unless @balance - debit >= DEFAULT_BALANCE
  end
end
