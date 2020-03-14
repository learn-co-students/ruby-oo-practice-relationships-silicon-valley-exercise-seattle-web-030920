class FundingRound
    attr_reader :startup, :venture_capitalist, :investment    
    @@all = []
    def initialize(startup:, venture_capitalist:, type:)        
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @@all << self
    end

    def investment=(investment)
        if(investment.positive?)
            @investment = investment.to_f
        end
    end

    def type
        @type.to_s
    end

    def self.all
        @@all
    end
end
