class Startup
    attr_reader :name, :domain, :founder
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain,name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        #add .all
        self.all.find {|startup| startup.founder == founder}
    end

    def self.domains
        #select will return the orignal stuff, map can return the mutated version
        #add .all
        self.all.map {|startup| startup.domain }
    end

end
