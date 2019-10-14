require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []
  

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
   
  end


  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def cats 
    Cat.all.select{|cat| cat.owner == self} 
   
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
   
  end

  def buy_cat(name)
    Cat.new(name, self)
    # binding.pry
  end

  
  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.map do |walk_dog|
      walk_dog.mood ="happy"
    end
  end

  def feed_cats
    cats.map do |feed_cat|
      feed_cat.mood = "happy"
    end
  end


  def sell_pets
    dogs.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    cats.map do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    
  end

  def list_pets
    "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
  end

  
 
 
end