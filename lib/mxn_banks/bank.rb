module MxnBanks
  class Bank
    attr_reader :name, :number, :abreviate

    def initialize(args)
      @name = args[:name]
      @number = args[:number]
      @abreviate = args[:abreviate]
    end
  end
end
