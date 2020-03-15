class VentureCapitalist
    attr_accessor :name 
    attr_reader :total_worth

    @@all=[]

    def initialize (name, total_worth=0)
        @name=name
        @total_worth=total_worth
        @@all<<self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select{|vcap| vcap.total_worth>=1000000000}
    end

    def offer_contract (startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.select{|round| round.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map{|round| round.startup}.uniq
    end

    def biggest_investment
        all_rounds=FundingRound.all.select{|round| round.venture_capitalist== self}
        all_rounds.max_by{|round| round.investment}
    end
   
    def invested(domain)
        start_up=Startup.all.find{|startup| startup.domain == domain}
        rounds=funding_rounds.select{|round| round.startup == start_up}
        rounds.map{|round| round.investment}.reduce(:+)
    end
end
