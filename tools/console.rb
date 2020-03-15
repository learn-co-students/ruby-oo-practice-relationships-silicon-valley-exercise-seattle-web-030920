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
st4 = Startup.new("name4", "founder4", nil)
st1.name

vc1 = VentureCapitalist.new("vc1", 123456789)
vc2 = VentureCapitalist.new("vc2", 10000000001)
vc3 = VentureCapitalist.new("vc3", 1000000000002)

#st1
#st1_fr1 = FundingRound.new(st1,vc1,"Angel",100000.0)
#st1_fr2 = FundingRound.new(st1,vc2,"Pre-Seed",10000000)
#st1_fr3 = FundingRound.new(st1,vc3,"Seed",100000000)
#st1_fr4 = FundingRound.new(st1,vc3,"Series A",1000000000)
#st2
#st2_fr1 =  FundingRound.new(st2,vc1,"Angel",100000.1)
#st2_fr2 = FundingRound.new(st2,vc2,"Pre-Seed",10000002)
#st2_fr3 = FundingRound.new(st2,vc3,"Seed",100000003)
#st2_fr4 = FundingRound.new(st2,vc3,"Series A",1000000004)

st1_fr1 = st1.sign_contract(vc1,"Angel",100000.0)
st1_fr2 = st1.sign_contract(vc2,"Pre-Seed",10000000)
st1_fr3 = st1.sign_contract(vc3,"Seed",100000000)
st1_fr4 = st1.sign_contract(vc3,"Series A",1000000000)

st2_fr1 = st2.sign_contract(vc1,"Angel",100000.1)
st2_fr2 = st2.sign_contract(vc2,"Pre-Seed",10000002)
st2_fr3 = st2.sign_contract(vc3,"Seed",100000003)
st2_fr4 = st2.sign_contract(vc3,"Series A",1000000004)

#leave this here to ensure binding.pry isn't the last line
binding.pry