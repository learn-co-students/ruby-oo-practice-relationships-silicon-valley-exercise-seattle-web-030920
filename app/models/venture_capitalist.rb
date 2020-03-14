class VentureCapitalist
    attr_reader :name, :total_worth
    @@all = []
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup: startup, venture_capitalist: self).investment = investment
    end

    def funding_rounds
        FundingRound.all.select{|funding_round|funding_round.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.map{|funding_round| funding_round.startup}.uniq
    end

    def biggest_investment
        self.funding_rounds.reduce{|curItem, nextItem| curItem.investment > nextItem.investment ? curItem : nextItem}
    end

    def invested(domain)
        self.funding_rounds.select{|funding_round| funding_round.startup.domain == domain}.map{|funding_round| funding_round.investment}.sum
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|vc| vc.total_worth > 1000000000}
    end
end
