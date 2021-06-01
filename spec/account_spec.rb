require 'account'

describe Account do
  subject(:account) { described_class.new }

  it 'should start empty' do
    expect(account.balance).to eq 0
  end

  it 'should change if a deposit has been made' do
    account.deposit(200)
    expect(subject.balance).to eq 200
  end
end
