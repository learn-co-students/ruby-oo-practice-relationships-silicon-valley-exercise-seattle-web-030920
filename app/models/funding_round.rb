class FundingRound

    attr_reader :startup, :venture_capitalist, :investment
    attr_accessor :type

    @@all = []

    def initialize(startup, venture_capitalist, investment, type)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @investment = investment.to_f.abs
        @type = type.to_s
        @@all << self
    end

    def self.all
        @@all
    end

    def venture_capitalist
        @venture_capitalist
    end

    def type
        @type
    end

    def investment
        @investment
    end

end
