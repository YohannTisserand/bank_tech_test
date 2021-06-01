require 'account'

describe Account do
  subject(:account) { described_class.new }

  it 'should start empty' do
    expect(account.balance).to eq 0
  end

  it 'should change if a deposit has been made' do
    account.deposit(200)
    expect(account.balance).to eq 200
  end

  it 'should change if a withdraw has been made' do
    account.deposit(200)
    account.withdraw(100)
    expect(account.balance).to eq 100
  end
end
