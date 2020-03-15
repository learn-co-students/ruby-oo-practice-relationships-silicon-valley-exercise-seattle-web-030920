class VentureCapitalist
    
    attr_reader :name, :total_worth
    @@all = []
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|vc| vc.total_worth > 1000000000}
    end

    def self.offer_contract(startup, investment_type, investment_amount)
        FundingRound.new(startup, self,investment_type, investment_amount)
    end

    def funding_rounds
        FundingRound.all.select {|fr| fr.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map{|fr| fr.startup}.uniq
    end

    def biggest_investment
        # largest_funding_round = nil
        # largest_funding = 0
        # funding_rounds.each { |fr|
        # if fr.investment > largest_funding 
        # largest_funding = fr.investment
        # largest_funding_round = fr
       # end
       # }
        
        #largest_funding_round

        funding_rounds.max{|a,b| a.investment <=> b.investment}
    end

    def invested(domain)
        total_amount = 0
        funding_rounds.map{|fr| 
        if fr.startup.domain == domain
            total_amount += fr.investment
        end}
        total_amount
    end
end
