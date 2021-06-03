class Transaction

  def initialize(credit: nil, debit: nil, balance: nil)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = credit
    @debit = debit
    @balance = balance
  end

  def print_logs
    "#{@date} || #{spaced(format(@credit))}|| #{spaced(format(@debit))}|| #{spaced(format(@balance))}"
  end

  private

  def spaced(item)
    "#{item} " if item
  end

  def format(item)
    '%.2f' % item if !item.nil?
  end
end
