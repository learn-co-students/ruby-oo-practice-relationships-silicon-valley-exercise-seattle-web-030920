require 'pry'
require_relative '../config/environment.rb'
require_relative '../app/models/funding_round.rb'
require_relative '../app/models/startup.rb'
require_relative '../app/models/venture_capitalist.rb'

def reload
  load 'config/environment.rb'
end


startup1 = Startup.new("SuperGoods", "Joe Schmoe", "Super Domain")
startup2 = Startup.new("Store", "Me", "My Domain")
startup3 = Startup.new("Next Big Thing", "Joe Schmoe", "Another Domain")

vc1 = VentureCapitalist.new("Bill Gates", 1000000000)
vc2 = VentureCapitalist.new("Christine", 100)
vc3 = VentureCapitalist.new("John Jacob", 500000)

funding_round1 = FundingRound.new(startup1, vc1, "Angel", 500000)
funding_round2 = FundingRound.new(startup1, vc2, "Series C", 15)
funding_round3 = FundingRound.new(startup1, vc2, "Seed", 25000)

# types of funding rounds: Angel, Pre-Seed, Seed, Series A, Series B, Series C

vc2.portfolio

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console



binding.pry
0 #leave this here to ensure binding.pry isn't the last line