class Transaction

  def initialize(amount: nil, balance: nil)
    @date = Time.now.strftime('%d/%m/%Y')
    @amount= amount
    @balance = balance
  end

  def print_logs
    if deposit?
      "#{@date} || #{spaced(format(@amount))}|| || #{spaced(format(@balance))}"
    elsif withdraw?
      "#{@date} || || #{spaced(format(@amount))}|| #{spaced(format(@balance))}"
    end
  end

  private

  def spaced(item)
    "#{item} " if item
  end

  def format(item)
    '%.2f' % item if !item.nil?
  end

  def deposit?
    @amount.positive?
  end

  def withdraw?
    @amount.negative?
  end
end
