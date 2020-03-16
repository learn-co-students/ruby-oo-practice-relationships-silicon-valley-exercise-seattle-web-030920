class VentureCapitalist
    attr_accessor :name, :total_worth
    ​
    @@all = []
    ​
        def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
        end
    ​
        def self.all
            @@all
        end
    ​
        def self.tres_commas_club
            VentureCapitalist.all.select { |capitalist|
                capitalist.total_worth >= 1000000000
            }
        end
    ​
        def offer_contract(startup, type, investment)
            FundingRound.new(startup, self, type, investment)
        end
    ​
        def funding_rounds
            FundingRound.all.select {|funding_round| funding_round.venture_capitalist == self}
        end
    ​
        def portfolio
            vc_rounds = funding_rounds
            vc_rounds.select {|funding_round| funding_round.startup.name}
            binding.pry
        end
    ​
    ​
    end
    
    ​
    ​
    # Build out the following methods on the VentureCapitalist class
    # VentureCapitalist#name
    # returns a string that is the venture capitalist's name
    # VentureCapitalist#total_worth
    # returns a number that is the total worth of this investor (e.g., think of it as how much money they have)
    # VentureCapitalist.all
    # returns an array of all venture capitalists
    # VentureCapitalist.tres_commas_club
    # returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 total_worth)
    ​
    ​
    # VentureCapitalist
    # VentureCapitalist#offer_contract
    # given a startup object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
    # VentureCapitalist#funding_rounds
    # returns an array of all funding rounds for that venture capitalist
    # VentureCapitalist#portfolio
    # Returns a unique list of all startups this venture capitalist has funded
    # VentureCapitalist#biggest_investment
    # returns the largest funding round given by this venture capitalist
    # VentureCapitalist#invested
    # given a domain string, returns the total amount invested in that domain
