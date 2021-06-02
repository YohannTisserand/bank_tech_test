class Transaction

  def initialize(credit: nil, debit: nil)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = credit
  end

  def print_logs
    "#{@date} || #{spaced(@credit)}|| || "
  end

  private

  def spaced(item)
    "#{item} " if item
  end
end
