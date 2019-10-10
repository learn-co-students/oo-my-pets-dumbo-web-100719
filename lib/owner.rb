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
    p "I am a #{@species}."
    #ask why puts won't work here
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
    Cat.all.select do |kitty_witty|
      kitty_witty.owner == self
    end
  end

  def dogs
    Dog.all.select do |doggy_woggy|
      doggy_woggy.owner == self
    end
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end

  def walk_dogs
    dogs.map do |doogy_woggy|
      doogy_woggy.mood = "happy"
    end
  end

  def feed_cats
    cats.map do |kitty_witty|
      kitty_witty.mood = "happy"
    end
  end

  def sell_pets
    cats.map do |kitty_witty|
      kitty_witty.owner = nil
      kitty_witty.mood = "nervous"
      # binding.pry
    end
    dogs.map do |doggy_woggy|
      doggy_woggy.owner = nil
      doggy_woggy.mood = "nervous"
    end
  end

  def list_pets
    num_cats = Cat.all.select do |kitty_witty|
      kitty_witty.owner == self
    end

    num_dogs = Dog.all.select do |doggy_woggy|
      doggy_woggy.owner == self
    end
    p "I have #{num_dogs.count} dog(s), and #{num_cats.count} cat(s)."
    # binding.pry
    # p "I have #{@owner.dogs.count} dog(s), and #{@owner.cats.count} cat(s)."
    
  end

end
