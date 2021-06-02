class Transaction

  def initialize(credit: nil, debit: nil, balance: nil)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = credit
    @debit = debit
    @balance = balance
  end

  def print_logs
    "date || credit || debit || balance\n" +
    "#{@date} || #{spaced(@credit)}|| #{spaced(@debit)}|| #{spaced(@balance)}"
  end

  private

  def spaced(item)
    "#{item} " if item
  end
end
