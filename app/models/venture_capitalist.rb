require 'pry'

class VentureCapitalist

    attr_accessor :name, :total_worth
    @@all = []

    def initialize (name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select {|capitalist| capitalist.total_worth >= 1000000000}
    end

    def portfolio
        self.funding_rounds.map { |round| round.startup}.uniq
    end

    def offer_contract (startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|funding_round| funding_round.venture_capitalist == self}
    end
  
    def biggest_investment 
        funding_rounds.max_by {|biggest_investment|biggest_investment.investment}
    end

    def invested(domain)
        funding_rounds.select { |round| round.startup.domain == domain}.map { |round| round.investment}.sum
    end
end



# VentureCapitalist -> Relationship Methods
# [X] VentureCapitalist#offer_contract
# [X] given a startup object, type of investment (as a string), and the amount invested (as a float), creates a new funding round 
# [X] and associates it with that startup and venture capitalist.
# [X] VentureCapitalist#funding_rounds
# [X] returns an array of all funding rounds for that venture capitalist
# [X] VentureCapitalist#portfolio
# [X] Returns a unique list of all startups this venture capitalist has funded
# [X] VentureCapitalist#biggest_investment
# [X] returns the largest funding round given by this venture capitalist
# [X] VentureCapitalist#invested
# [X] given a domain string, returns the total amount invested in that domain



# Build out the following methods on the VentureCapitalist class
# [X] VentureCapitalist#name
# [X] returns a string that is the venture capitalist's name
# [X] VentureCapitalist#total_worth
# [X] returns a number that is the total worth of this investor (e.g., think of it as how much money they have)
# [X] VentureCapitalist.all
# [X] returns an array of all venture capitalists
# [X] VentureCapitalist.tres_commas_club
# [X] returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 total_worth)
