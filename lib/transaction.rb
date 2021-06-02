class Transaction

  def initialize
    @date = Time.now.strftime('%d/%m/%Y') 
  end

  def print_logs
   "#{@date} || || ||"
  end
end