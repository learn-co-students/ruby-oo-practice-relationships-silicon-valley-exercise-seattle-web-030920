require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
startup1 = Startup.new("foo", "bar", "www.foobar.com")
startup2 = Startup.new("baz", "qux", "www.bazqux.com")

Startup.find_by_founder("foo")
Startup.domains

investor1 = VentureCapitalist.new("adam", 100000000000)
investor2 = VentureCapitalist.new("eve", 50)

funding1 = FundingRound.new(startup1, investor1, "Angel", 20.15)
funding2 = FundingRound.new(startup1, investor1, "Angel", 25)
funding2 = FundingRound.new(startup2, investor2, "Angel", -12.15)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line
