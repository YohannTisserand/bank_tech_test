require 'transaction'

describe Transaction do

  context '#print_logs' do
    it 'display a date' do
      expect(subject.print_logs).to eq "02/06/2021 || || || "
    end
  end
  
  context '#credit' do
    it 'pushes a deposit into the logs' do
      subject = Transaction.new(credit: 2000)
      expect(subject.print_logs).to eq "02/06/2021 || 2000 || || "
    end
  end

  context '#debit' do
    it 'pushes a withdraw into the logs' do
      subject = Transaction.new(debit: 200)
      expect(subject.print_logs).to eq "02/06/2021 || || 200 || "
    end
  end

  context '#balance' do
    it 'pushes a balance into the logs' do
      subject = Transaction.new(credit: 300, debit: 200, balance: 100)
      expect(subject.print_logs).to eq "02/06/2021 || 300 || 200 || 100 "
    end
  end
end
