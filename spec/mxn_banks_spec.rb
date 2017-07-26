require 'spec_helper'
require 'json'
require 'pry'

RSpec.describe MxnBanks do
  let!(:bank) do
    OpenStruct.new(number: '012',
                   name: 'BBVA Bancomer, S.A.',
                   abreviate: 'BBVA BANCOMER')
  end
  it 'has a version number' do
    expect(MxnBanks::VERSION).not_to be nil
  end

  it 'Hash with all banks info' do
    banks = JSON.parse(File.read('lib/banks.json'), symbolize_names: true)
    expect(MxnBanks.to_hash).to eq(banks)
  end
  it 'Hash with bank info' do
    a = MxnBanks.from_iban('01211111111111111')
    expect(a.number).to eq(bank.number)
    expect(a.name).to eq(bank.name)
    expect(a.abreviate).to eq(bank.abreviate)
  end  

  it 'Return Valid CLABE' do
    expect(MxnBanks.valid?('044320010044816821')).to be true
  end
    
  it 'Return invalid CLABE' do
    expect(MxnBanks.valid?('044320010044816824')).to be false
  end
end
