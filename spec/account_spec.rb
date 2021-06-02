require 'account'

describe Account do

  context 'balance should start at 0' do
    it 'should start empty' do
      expect(subject.balance).to eq Account::DEFAULT_BALANCE
    end
  end

  context 'when a deposit has been made' do
    it 'should change if a deposit has been made' do
      subject.deposit(200)
      expect(subject.balance).to eq 200
    end
  end

  context 'a user withdraw some cash' do
    it 'should change if a withdraw has been made' do
      subject.deposit(200)
      subject.withdraw(100)
      expect(subject.balance).to eq 100
    end
  end

  context 'raise error against unexpected behavior' do
    it 'raises an error if withdraw without enough funds' do
      subject.deposit(100)
      expect { subject.withdraw(200) }.to raise_error "Not enough funds"
    end

    it 'raises an error if deposit is nil' do
      expect { subject.deposit(0) }.to raise_error "must be at least £1"
    end
  end

  context 'a user wants to print a statement' do
    it 'should output the statement' do
      allow(subject.statement).to receive(:print).twice
      subject.statement
    end
  end

  context 'a user wants to make a transaction' do
    it 'allows a deposit' do
      transaction_class = double(:transaction_class, new: :transaction)
      subject = described_class.new(transaction_class: transaction_class)
      expect(transaction_class).to receive(:new).with(credit: 100, balance: 100)
      subject.deposit(100)
    end

    it 'allows a withdraw' do
      transaction_class = double(:transaction_class, new: :transaction)
      subject = described_class.new(transaction_class: transaction_class)
      subject.deposit(1000)
      expect(transaction_class).to receive(:new).with(debit: 100, balance: 900)
      subject.withdraw(100)
    end
  end
end
