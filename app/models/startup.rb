class Startup
  attr_accessor :name, :domain
  attr_reader :founder

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
    self.domain = domain
    self.name = name
  end

  def self.find_by_founder(founder_name)
    @@all.find{|startup|startup.founder == founder_name}
  end

  def self.domains
    @@all.map{|startup|startup.domain}
  end

  def sign_contract(venture_capitalist, investment_type, amount_invested)
    FundingRound.new(self, venture_capitalist, investment_type, amount_invested)
  end

  def num_funding_rounds
    FundingRound.all.select{|round|round.startup == self}.countst
  end

  def total_funds
    sum = 0
    FundingRound.all.map{|funding|sum += funding.investment}
    sum
  end

  def my_fundinground
    fundinground = FundingRound.all.select{|funding|funding.startup == self}
  end

  def investors
    self.my_fundinground.map{|funding|funding.venture_capitalist}.uniq
  end

  def big_investors
    investors.select{|investor|VentureCapitalist.tres_commas_club.include?(investor)}
  end
end
