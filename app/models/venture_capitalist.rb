class VentureCapitalist

    attr_reader :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name.to_s
        @total_worth = total_worth.to_f
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select {|capitalist| capitalist.total_worth > 1000000000}
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, amount, type)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.uniq
    end

    def biggest_investment
        self.funding_rounds.max {|investment1, investment2| investment1.investment <=> investment2.investment}
    end

    def invested(domain)
        total = 0
        self.funding_rounds.select {|round| round.startup.domain == domain ? total += round.investment : nil}
        total
    end

end
