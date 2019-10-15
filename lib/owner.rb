require 'pry'
class Owner
  @@all = []
  attr_reader :name, :species
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    p "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select{|cats| cats.owner == self}
  end

  def dogs
    Dog.all.select{|dogs| dogs.owner == self}
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.each{|dogs| dogs.mood = "happy"}
    # binding.pry
  end

  def feed_cats
    self.cats.each{|cats| cats.mood = "happy"}
  end

  def sell_pets
    self.dogs.each{|dogs| dogs.mood = "nervous"; dogs.owner = nil}
    self.cats.each{|cats| cats.mood = "nervous"; cats.owner = nil}
  end

  def list_pets
    p "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    # binding.pry
  end



end