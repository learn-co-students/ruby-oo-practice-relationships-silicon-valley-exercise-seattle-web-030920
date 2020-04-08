require 'pry'
require 'pp'
require_relative '../config/environment.rb'
require_relative '../app/models/funding_round.rb'
require_relative '../app/models/startup.rb'
require_relative '../app/models/venture_capitalist.rb'

def reload
  load 'config/environment.rb'
end

name =  "SuperGoods"
founder = "Joe Schmoe"
domain = "This is a mystery"

venture1 = VentureCapitalist.new("Monopoly Man", 10000000000)
venture2 = VentureCapitalist.new("Josh", 1000)
venture3 = VentureCapitalist.new("Rebecca", 10000)
venture4 = VentureCapitalist.new("Sundar Pichai", 1234567890)


test_startup = Startup.new(name, founder, domain)
start1 = Startup.new("Store", "Me", "My Domain")
Startup.all
Startup.find_by_founder(founder)
Startup.domains
test_startup.pivot("Second Chances", "Take 2")
Startup.all


 test_startup.sign_contract(venture1, "Angel", 500000)
 test_startup.sign_contract(venture3, "Seed", 1000)
 venture2.offer_contract(start1, "Series B", 100)
 test_startup.sign_contract(venture3, "Seed", 100)
 
 test_startup.num_funding_rounds
pp venture3.funding_rounds
venture3.portfolio
binding.pry


# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console



binding.pry
0 #leave this here to ensure binding.pry isn't the last line