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
    return "I am a #{self.species}."
  end
  
  def self.all
    return @@all
  end

  def self.count
    Owner.all.count
  end

  def self.reset_all
    Owner.all.clear
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self) 
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
    self.dogs
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
    self.cats
  end

  def sell_pets
    self.cats.each do |cat| 
      cat.mood = "nervous"
      cat.owner = nil
    end
    self.dogs.each do |dog| 
      dog.mood = "nervous"
      dog.owner = nil
    end
    Owner.reset_all
    
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end