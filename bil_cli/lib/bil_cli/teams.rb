class Teams

    @@all = []

 attr_accessor :name, :conference, :city

 def initialize(name, conference, city)
    @name = name
    @conference = conference
    @city = city
    save 
 end

 def team_initialize(team_hash)
   team_hash.each do |k, v|
     self.send("#(k)=", "v") if self.respond_to?("#(k)=")
   end
   save
end

 def save 
    @@all << self
 end
 
 def self.all
    @@all
 end


 def self.find_team(team_name)
self.all.select do |team|
   team.name == team_name
end
  end

end   