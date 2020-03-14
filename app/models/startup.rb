class Startup

    attr_reader :founder, :domain
    attr_accessor :name

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def sign_contract(capitalist, type, investment)
        FundingRound.new(self, capitalist, type, investment)
    end

    def funding_rounds
        FundingRound.all.select{|round| round.startup == self}
    end

    def num_funding_rounds
        self.funding_rounds.count
    end

    def total_funds
        self.funding_rounds.map{|round| round.investment}.reduce(:+)
    end

    def investors
        self.funding_rounds.map{|round| round.venture_capitalist}.uniq
    end

    def big_investors
        VentureCapitalist.tres_commas_club & self.investors
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        @@all.find{|startup| startup.founder == founder}
    end

    def self.domains
        @@all.collect{|startup| startup.domain}
    end

end
