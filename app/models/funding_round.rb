require 'pry'

class FundingRound

    attr_reader :startup, :venture_capitalist
    attr_accessor :type, :investment
    @@all = []

    def initialize (startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        (investment >= 0) ? (@investment = investment) : (@investment = 0)

        @@all << self
    end

    def self.all
        @@all
    end
end


# Build out the following methods on the FundingRound class
# [X] FundingRound#startup
# [X] returns the startup object for that given funding round
# [X] Once a funding round is created, I should not be able to change the startup
# [X] FundingRound#venture_capitalist
# [X] returns the venture capitalist object for that given funding round
# [X] Once a funding round is created, I should not be able to change the venture capitalist
# [X] FundingRound#type
# [X] returns a string that is the type of funding round
# [X] Examples include: Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc.
# [X] FundingRound#investment
# [X] returns a number that is the amount invested during this funding round
# [X] This should be a float that is not a negative number.
# [X] FundingRound.all
# [X] returns all of the funding rounds