class Startup

    attr_reader :founder, :domain, :name

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        @name = name
        @domain = domain
    end

    def self.find_by_founder(founder)
        Startup.all.find {|startup| startup.founder == founder}
    end

    def self.domains
        Startup.all.map {|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, amount, type)
        FundingRound.new(self, venture_capitalist, amount, type)
    end

    def num_funding_rounds
        FundingRound.all.select {|round| round.startup == self}.length
    end

    def total_funds
        total = 0
        FundingRound.all.select {|round| round.startup == self ? total += round.investment : nil}
        total
    end

    def investors
        FundingRound.all.map {|round| round.startup == self ? round.venture_capitalist : nil}.compact.uniq
    end

    def big_investors
        VentureCapitalist.tres_commas_club.select {|capitalist| self.investors.include?(capitalist)}.uniq
    end
end
