require_relative '../config/environment.rb'
require_relative '../app/models/startup.rb'
require_relative '../app/models/venture_capitalist.rb'
require_relative '../app/models/funding_round.rb'
def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
s1 = Startup.new("Wango", "Bob Smith", "space space")
richguy1 = VentureCapitalist.new("Rich Dude 1", 1000)
richguy2 = VentureCapitalist.new("Jeffy-boy", 21309481309534)
fr1 = FundingRound.new(s1, richguy2, 1000000000, "Angel")
binding.pry
0 #leave this here to ensure binding.pry isn't the last line