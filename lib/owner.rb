require 'pry'

class Owner
   attr_reader :name, :species
   
   @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
   end

   def say_species
    p "I am a #{self.species}."
   end

   def self.all
    @@all
   end

   def self.count
    self.all.count
   end

   def self.reset_all
      self.all.clear
   end

   def cats
    Cat.all.select {|cat| cat.owner == self}
   end

   def dogs
      Dog.all.select {|dog| dog.owner == self}
   end

   def buy_cat(name)
      Cat.new(name,self)
   end

   def buy_dog(name)
      Dog.new(name,self)
   end

   def walk_dogs
   #    Dog.all.select do |dog|
   #       if dog.owner == self then
   #         dog.mood = "happy"
   #       end
   #   end
      # this uses the method #dogs which already selects all the dogs that the owner has
      self.dogs.each {|dog| dog.mood = "happy"}
   end

   def feed_cats
      # Cat.all.select do |cat|
      #     if cat.owner == self then
      #       cat.mood = "happy"
      #     end
      # end
      self.cats.each {|cat| cat.mood = "happy"}
   end

   def sell_pets
     pets = self.cats + self.dogs
     pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
     end
   end

   def list_pets
      dogs = Dog.all.select {|dog| dog.owner == self}
      cats = Cat.all.select {|cat| cat.owner == self}
      # binding.pry
      mssg = "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
   end

   

end



# binding.pry