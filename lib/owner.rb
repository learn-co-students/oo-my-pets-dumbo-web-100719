require "pry"

class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
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
    Cat.all.select do |cat_instance|
      cat_instance.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog_instance|
      dog_instance.owner == self
    end
  end

  def buy_cat(cat_name)
    cat_name = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    dog_name = Dog.new(dog_name, self)
  end

  def walk_dogs
    owned_dogs = self.dogs
    owned_dogs.map do |dog_instance|
      dog_instance.mood = "happy"
    end
  end

  def feed_cats
    owned_cats = self.cats
    owned_cats.map do |cat_instance|
      cat_instance.mood = "happy"
    end
  end

  def sell_pets
    animal_list = self.dogs.concat(self.cats)
    animal_list.map do |animal_instance|
      animal_instance.mood = "nervous"
      animal_instance.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end