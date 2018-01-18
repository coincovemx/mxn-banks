module MxnBanks
  class Bank
    attr_reader :name, :number, :abbreviate

    def initialize(args)
      @name = args[:name]
      @number = args[:number]
      @abbreviate = args[:abbreviate]
    end
  end
end
