require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

pied_piper=Startup.new("Pied Piper", "Richard", "www.piedpiper.com")
aviato=Startup.new("Aviato", "Erlich", "www.aviato.com")
hotdog_or_not=Startup.new("Hot Dog or Not", "Jian-Yang","www.hotdogornot.com" )
hooli=Startup.new("Hooli","Gavin Belson", "www.hooli.com")

raviga=VentureCapitalist.new("Raviga", 1000000000)
peter_gregory=VentureCapitalist.new("Peter Gregory", 600000)
russ_hanneman=VentureCapitalist.new("Russ Hanneman", 999999999.99)

fr1=FundingRound.new(hooli, raviga, "angel", 20000)
fr2=FundingRound.new(hooli, raviga, "angel", 40000)
fr3=FundingRound.new(hotdog_or_not, raviga, "angel", 20000)

peter_gregory.offer_contract(hooli,"angel", 4)
aviato.sign_contract(russ_hanneman, "angel", 10)

ans=raviga.invested("www.hooli.com")
binding.pry

0 #leave this here to ensure binding.pry isn't the last line