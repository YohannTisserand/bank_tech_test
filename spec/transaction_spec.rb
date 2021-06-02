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
end
