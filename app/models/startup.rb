require 'pry'
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

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        #add .all
        self.all.find {|startup| startup.founder == founder_name}
    end

    def self.domains
        #select will return the matching |startup|
        #self.all.select{|startup| startup.domain}
        #map can return the mutated version
        #add .all
        self.all.map {|startup| startup.domain }
    end

    def sign_contract(venture_capitalist,investment_type,investment_amount)
        FundingRound.new(self,venture_capitalist,investment_type,investment_amount)
    end

    def funding_rounds
        funds = FundingRound.all.select {|fr| fr.startup == self}
    end

    def num_funding_rounds
        funding_rounds.length
    end

    def total_funds
        total_funds = 0
        funding_rounds.map {|fr| total_funds +=fr.investment}
        total_funds
    end

    def investors
        funding_rounds.map{|fr| fr.venture_capitalist}.uniq
    end

    def big_investors
        #use map get true/false
        club = VentureCapitalist.tres_commas_club
        investors.select{|investor| club.include?(investor)}
    end

    
end
