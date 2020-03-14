#require_relative '../config/environment.rb'
require_relative '../app/models/funding_round.rb'
require_relative '../app/models/startup.rb'
require_relative '../app/models/venture_capitalist.rb'

require 'pry'

# def reload
#   load 'config/environment.rb'
# end
# # Insert code here to run before hitting the binding.pry
# # This is a convenient place to define variables and/or set up new object instances,
# # so they will be available to test and play around with in your console
 st1 = Startup.new("name1", "founder1", "domain1.com")
 st2 = Startup.new("name2", "founder2", "domain2.com")
 st3 = Startup.new("name3", "founder3", "domain3.com")

vc1 = VentureCapitalist.new("vc1", 1023456789)
st1.sign_contract(vc1, "GoodTimes", 50)

vc2 = VentureCapitalist.new("vc2", 100000121)
st1.sign_contract(vc2, "ForSad", 25)
puts st1.investors

vc3 = VentureCapitalist.new("vc3", 10000000002)
st1.sign_contract(vc3, "MildTimes", 400)
st2.sign_contract(vc1, "NeutralBadTimes",  40000)
puts "Big Investors"
puts st1.big_investors.map{|bi| bi.name}

puts "vc1 items funding rounds"
puts vc1.funding_rounds.map{|x| x.startup.name}
puts "vc1 items portfolio"
puts vc1.portfolio.map{|x| x.name}  

puts "vc1 items biggest"
puts vc1.biggest_investment

puts vc1.invested("domain2.com")

# binding.pry
0 #leave this here to ensure binding.pry isn't the last line