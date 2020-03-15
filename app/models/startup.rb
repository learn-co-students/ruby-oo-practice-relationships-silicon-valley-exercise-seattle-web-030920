class Startup
    attr_accessor :name 
    attr_reader :founder, :domain

    @@all=[]

    def initialize (name, founder, domain)
        @name=name
        @founder=founder
        @domain=domain
        @@all<<self
    end

    def pivot (domain, name)
        self.domain=domain
        self.name=name
    end

    def self.all
        @@all
    end

    def self.find_by_founder (name)
        Startup.all.find {|startup| startup.founder==name}
    end

    def self.domains
        Startup.all.map {|startup| startup.domain}
    end

    def sign_contract (venture_cap, type, amount)
        FundingRound.new(self, venture_cap, type, amount)
    end

    def num_funding_rounds
        FundingRound.all.select{|round| round.startup == self}.length
    end

    def all_rounds
        FundingRound.all.select{|round| round.startup == self}
    end 
    def total_funds
        all_rounds.map{|round| round.investment}.reduce(:+)
    end
    def investors
        all_rounds.map{|round| round.venture_capitalist}.uniq
    end
    def big_investors
        investors.select{|investor| investor.total_worth>=1000000000}
    end

end
