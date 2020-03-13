require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
st1 = Startup.new("name1", "founder1", "domain1.com")
st2 = Startup.new("name2", "founder2", "domain2.com")
st3 = Startup.new("name3", "founder3", "domain3.com")

st1.name

vc1 = VentureCapitalist.new("vc1", 123456789)
vc2 = VentureCapitalist.new("vc2", 10000000001)
vc3 = VentureCapitalist.new("vc3", 10000000002)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line