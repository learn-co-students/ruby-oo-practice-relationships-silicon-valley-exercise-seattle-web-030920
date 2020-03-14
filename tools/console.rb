require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

test_startup = Startup.new("Test Name", "Test Founder", "test_domain.com")
fun_startup = Startup.new("Funny", "Fun Founder", "fun_domain.org")

rich_guy = VentureCapitalist.new("Rich Guy", 20000000000.0)
poor_guy = VentureCapitalist.new("Poor Guy")

first_round = FundingRound.new(fun_startup, poor_guy, "Angel", 17.0)
second_round = FundingRound.new(test_startup, rich_guy, "Seed", 20000)
third_round = FundingRound.new(fun_startup, rich_guy, "Pre-Seed", 50000)

test_startup.sign_contract(poor_guy, "Series A", 5)
rich_guy.offer_contract(fun_startup, "Seed", 6000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line