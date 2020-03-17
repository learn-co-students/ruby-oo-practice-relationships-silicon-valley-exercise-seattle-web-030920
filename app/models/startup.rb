
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

end

# Startup
# [x]Startup#sign_contract
# [x]given a venture capitalist object, type of investment (as a string), and the amount invested (as a float), 
# [x]creates a new funding round and associates it with that startup and venture capitalist.
# [x]Startup#num_funding_rounds
# [x]Returns the total number of funding rounds that the startup has gotten
# Startup#total_funds
# Returns the total sum of investments that the startup has gotten
# Startup#investors
# Returns a unique array of all the venture capitalists that have invested in this company
# Startup#big_investors
# Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club


# Build the following methods on the Startup class
# *Startup#name
# *returns a string that is the startup's name
# *Startup#founder
# *returns a string that is the founder's name
# *Once a startup is created, the founder cannot be changed.
# *Startup#domain
# *returns a string that is the startup's domain
# *Startup#pivot
# *given a string of a domain and a string of a name, change the domain and name of the startup. 
# *This is the only public method through which the domain should be changed.
# *Startup.all
# *should return all of the startup instances
# *Startup.find_by_founder
# *given a string of a founder's name, returns the first startup whose founder's name matches
# *Startup.domains
# *should return an array of all of the different startup domains