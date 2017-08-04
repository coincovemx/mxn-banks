require 'spec_helper'
require 'json'
require 'pry'

RSpec.describe MxnBanks do
  let!(:clabes) do
    {
      valid:   ['002073662461479944', '012098011316193496', '014427566437837360'],
      invalid: ['002073662461479942', '0120980113192', '014427566437837362']
    } 
  end
  let!(:bank) do
    OpenStruct.new( number: '012', name: 'BBVA Bancomer, S.A.', abreviate: 'BBVA BANCOMER' )
  end

  it 'has a version number' do
    expect(MxnBanks::VERSION).not_to be nil
  end
  context 'to_hash' do
    it 'Hash with all banks info' do
      banks = JSON.parse(File.read('lib/banks.json'), symbolize_names: true)
      expect(MxnBanks.to_hash).to eq(banks)
    end
  end 

  context 'from_iban' do
    it 'Hash with bank info' do
      a = MxnBanks.from_iban('01211111111111111')
      expect(a.number).to eq(bank.number)
      expect(a.name).to eq(bank.name)
      expect(a.abreviate).to eq(bank.abreviate)
    end 
    it 'should raise Argument Error' do
      expect {MxnBanks.from_iban('123456789123456789')}.to raise_error(ArgumentError)
    end
  end

  context 'valid?' do
    it 'Return Valid CLABE' do
      clabes[:valid].each do |clabe|
        expect(MxnBanks.valid?(clabe)).to be true
      end     
    end 
    it 'Return invalid CLABE' do
      clabes[:invalid].each do |clabe|
        expect(MxnBanks.valid?(clabe)).to be false
      end    
    end 
  end
end
