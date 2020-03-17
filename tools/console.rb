require 'pry'
require 'pp'
require_relative '../config/environment.rb'
require_relative '../app/models/funding_round.rb'
require_relative '../app/models/startup.rb'
require_relative '../app/models/venture_capitalist.rb'

def reload
  load 'config/environment.rb'
end


venture1 = VentureCapitalist.new("Monopoly Man", 10000000000)
venture2 = VentureCapitalist.new("Josh", 1000)
venture3 = VentureCapitalist.new("Rebecca", 10000)
venture4 = VentureCapitalist.new("Sundar Pichai", 1234567890)

start1 = Startup.new("Giga Watch", "James McDonnel", "Tech")
start2 = Startup.new("SuperGoods", "Joe Schmoe", "Lifestyle")
start3 = Startup.new("Ripped Jeans Co.", "Paris Hilton", "Lifestyle")
start4 = Startup.new("Mecha Bake", "Julia Grandchilds", "Tech")
Startup.all
# Startup.find_by_founder(founder)
Startup.domains
#test_startup.pivot("Second Chances", "Take 2")
Startup.all


 start1.sign_contract(venture1, "Angel", 500000)
 start1.sign_contract(venture1, "Rescue.", 5000000)

 start2.sign_contract(venture3, "Seed", 1000)
 start2.sign_contract(venture3, "Seed", 100)

 start3.sign_contract(venture2, "Pre-Seed", 150)
 start3.sign_contract(venture2, "Series A", 200)

 venture2.offer_contract(start1, "Series B", 100)
 venture4.offer_contract(start4, "Seed", 466453)
 
 
start1.num_funding_rounds
pp venture3.funding_rounds
venture3.portfolio
p start1.big_investors
p start4.big_investors
#binding.pry


# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console



#binding.pry
0 #leave this here to ensure binding.pry isn't the last line