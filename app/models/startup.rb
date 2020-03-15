
class Startup

    attr_reader :founder
    attr_accessor :name, :domain

    @@all = []

    def initialize (name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def pivot (domain, name)
        self.domain = domain   
        self.name = name    
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        Startup.all.find {|startup| startup.founder == founder_name}
    end

    def self.domains
        Startup.all.map {|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.select {|funding_round| funding_round.startup == self}.count
    end

    def funding_rounds
        FundingRound.all.select { |round| round.startup == self}
    end

    def total_funds
        received_investments = funding_rounds
        received_investments.map { |round| round.investment}.sum
    end

    def investors
        funding_rounds.map { |round| round.venture_capitalist}.uniq
    end

    def big_investors
        investors.select { |investor|  VentureCapitalist.tres_commas_club.includes(  investor)}    
    end
end




# Startup -> Relationship Methods
# [X] Startup#sign_contract
# [X] given a venture capitalist object, type of investment (as a string), and the amount invested (as a float), 
# [X] creates a new funding round and associates it with that startup and venture capitalist.
# [X] Startup#num_funding_rounds
# [X] Returns the total number of funding rounds that the startup has gotten
# [X] Startup#total_funds
# [X] Returns the total sum of investments that the startup has gotten
# [X] Startup#investors
# [X] Returns a unique array of all the venture capitalists that have invested in this company
# [X] Startup#big_investors
# [X] Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club




# Build the following methods on the Startup class
# [X] Startup#name
# [X] returns a string that is the startup's name
# [X] Startup#founder
# [X] returns a string that is the founder's name
# [X] Once a startup is created, the founder cannot be changed.
# [X] Startup#domain
# [X] returns a string that is the startup's domain
# [X] Startup#pivot
# [X] given a string of a domain and a string of a name, change the domain and name of the startup. 
# [X] This is the only public method through which the domain should be changed.
# [X] Startup.all
# [X] should return all of the startup instances
# [X] Startup.find_by_founder
# [X] given a string of a founder's name, returns the first startup whose founder's name matches
# [X] Startup.domains
# [X] should return an array of all of the different startup domains
