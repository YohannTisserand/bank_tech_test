require 'transaction'

describe Transaction do

  context '#print_logs' do
    it 'display a date' do
      expect(subject.print_logs).to eq "#{date} || || || "
    end
  end
  
  context '#credit' do
    it 'pushes a deposit into the logs' do
      subject = Transaction.new(credit: 2000)
      expect(subject.print_logs).to eq "#{date} || 2000.00 || || "
    end
  end

  context '#debit' do
    it 'pushes a withdraw into the logs' do
      subject = Transaction.new(debit: 200)
      expect(subject.print_logs).to eq "#{date} || || 200.00 || "
    end
  end

  context '#balance' do
    it 'pushes a balance into the logs' do
      subject = Transaction.new(credit: 300, debit: 200, balance: 100)
      expect(subject.print_logs).to eq "#{date} || 300.00 || 200.00 || 100.00 "
    end
  end

  def date
    Time.now.strftime('%d/%m/%Y')
  end
end
