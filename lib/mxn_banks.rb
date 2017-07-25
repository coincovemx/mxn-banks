require "mxn_banks/version"
autoload :Bank , 'mxn_banks/bank'

module MxnBanks
  def self.from_iban(num)
    a = to_hash.select { |b| b[:number] == num.slice(0, 3) }
    Bank.new(a.first)
  end

  def self.to_hash
    json_file = File.read(File.join(File.dirname(__FILE__), 'banks.json'))
    @banks ||= JSON.parse(json_file, symbolize_names: true)
  end
end
