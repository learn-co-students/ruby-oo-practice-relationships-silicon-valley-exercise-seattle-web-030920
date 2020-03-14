class Startup
    attr_reader :name, :domain, :founder
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain,name)
        @domain = domain
        @name = name
    end

    def sign_contract(venture_capital, type, amount)
        FundingRound.new(venture_capitalist: venture_capital, type: type, startup: self).investment = amount        
    end

    def num_funding_rounds
        FundingRound.all.select{|funding_round| funding_round.startup == self}
    end

    def total_funds
        self.num_funding_rounds.reduce(0.0){|sum, funding_round|sum + funding_round.investment}

    end

    def investors        
        self.num_funding_rounds.map{|funding_round| funding_round.venture_capitalist}.uniq
    end

    def big_investors        
        VentureCapitalist.tres_commas_club & self.investors
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        #add .all
        self.all.find {|startup| startup.founder == founder}
    end

    def self.domains
        #select will return the orignal stuff, map can return the mutated version
        #add .all
        self.all.map {|startup| startup.domain }
    end

end
