require 'transaction'

describe Transaction do
  
  context '#print_logs' do
    it 'display a date' do
      expect(subject.print_logs).to eq "02/06/2021 || || ||"
    end
  end
end