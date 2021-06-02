require 'account'

describe Account do
  it 'should start empty' do
    expect(subject.balance).to eq Account::DEFAULT_BALANCE
  end

  it 'should change if a deposit has been made' do
    subject.deposit(200)
    expect(subject.balance).to eq 200
  end

  it 'should change if a withdraw has been made' do
    subject.deposit(200)
    subject.withdraw(100)
    expect(subject.balance).to eq 100
  end

  it 'raises an error if withdraw without enough funds' do
    subject.deposit(100)
    expect { subject.withdraw(200) }.to raise_error "Not enough funds"
  end

  it 'prints the header' do
    expect(subject.header).to eq 'date || credit || debit || balance'
  end
end
