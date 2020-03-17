class FundingRound
    attr_reader :startup, :venture_capitalist
    attr_accessor :type, :investment

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment
        @@all << self
    end

    def self.all
        @@all
    end
#binding.pry
end

# Build out the following methods on the FundingRound class
# [x]FundingRound#startup
# [x]returns the startup object for that given funding round
# [x]Once a funding round is created, I should not be able to change the startup
# [x]FundingRound#venture_capitalist
# [x]returns the venture capitalist object for that given funding round
# [x]Once a funding round is created, I should not be able to change the venture capitalist
# [x]FundingRound#type
# [x]returns a string that is the type of funding round
# [x]Examples include: Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc.
# [x]FundingRound#investment
# [x]returns a number that is the amount invested during this funding round
# [x]This should be a float that is not a negative number.
# [x]FundingRound.all
# [x]returns all of the funding rounds