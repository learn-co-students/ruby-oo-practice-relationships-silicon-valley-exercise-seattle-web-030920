class VentureCapitalist
attr_accessor :name, :total_worth

@@all = []

    def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select { |capitalist|
            capitalist.total_worth >= 1000000000
        }
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|funding_round| funding_round.venture_capitalist == self}
    end

    def portfolio
       self.funding_rounds.map {|funding_round| funding_round.startup.name}.uniq
        #binding.pry
    end

    def biggest_investment
        funding_rounds.max_by do |biggest_investment|
            biggest_investment.investment
        end
    end

    def invested(domain)
        self.funding_rounds.select {|round| round.startup.domain == domain}.map{|round| round.investment}.sum
    end

end

# VentureCapitalist
# [x]VentureCapitalist#offer_contract
# [x]given a startup object, type of investment (as a string), and the amount invested (as a float), creates a new funding round 
# [x]and associates it with that startup and venture capitalist.
# [x]VentureCapitalist#funding_rounds
# [x]returns an array of all funding rounds for that venture capitalist
# [x]VentureCapitalist#portfolio
# [x]Returns a unique list of all startups this venture capitalist has funded
# [x]VentureCapitalist#biggest_investment
# [x]returns the largest funding round given by this venture capitalist
# [x]VentureCapitalist#invested
# [x]given a domain string, returns the total amount invested in that domain



# Build out the following methods on the VentureCapitalist class
# [x]VentureCapitalist#name
# [x]returns a string that is the venture capitalist's name
# [x]VentureCapitalist#total_worth
# [x]returns a number that is the total worth of this investor (e.g., think of it as how much money they have)
# [x}VentureCapitalist.all
# [x]returns an array of all venture capitalists
# [x}VentureCapitalist.tres_commas_club
# [x}returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 total_worth)