class VentureCapitalist

    attr_reader :total_worth
    attr_accessor :name

    @@all = []

    def initialize(name, total_worth = 0.0)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select{|round| round.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.map{|round| round.startup}.uniq
    end

    def biggest_investment
        self.funding_rounds.max_by{|round| round.investment}
    end

    def invested(domain)
        rounds = self.funding_rounds.select{|round| round.startup.domain == domain}
        rounds.collect{|round| round.investment}.reduce(:+)
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select{|capitalist| capitalist.total_worth > 1000000000.0}
    end

end
