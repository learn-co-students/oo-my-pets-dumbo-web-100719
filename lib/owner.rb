require 'pry'

class Owner
  # code goes here

@@all = []
attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select do |kitty|
      kitty.owner == self
    end
  end

  def dogs
    Dog.all.select do |doggy|
      doggy.owner == self
    end
  end

  def buy_cat(cat_name)
    cat_name = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    dog_name = Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.map do |doggy|
      doggy.mood = "happy"
    end
  end
  
   def feed_cats
      cats.map do |kitty|
        kitty.mood = "happy"
      end
    end

  def sell_pets
    dogs.map do |doggy|
      doggy.mood = "nervous"
      doggy.owner = nil
    end
    cats.map do |kitty|
      kitty.mood = "nervous"
      kitty.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
  end
end