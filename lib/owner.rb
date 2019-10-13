require 'pry'

class Owner
  # code goes here

  attr_reader :name, :species, :say_species

  @@all = []

    def initialize (name)
      @name = name
      @species = "human"
      @say_species = "I am a human."

      @@all << self
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
      Cat.all.select do |cat|
        cat.owner == self
      end 
    end 

    def dogs
      Dog.all.select do |dog|
        dog.owner == self
      end 
    end 

    def buy_cat (name)
      Cat.new(name, self, "nervous")
    end 

    def buy_dog(name)
      Dog.new(name, self, "nervous")
    end 
    
    def walk_dogs
      self.dogs.each do |dog| 
        dog.mood = "happy"
      end

      def feed_cats
        self.cats.each do |cat|
          cat.mood = "happy"
        end
      end 

      def sell_pets
      pets = self.dogs + self.cats #let pets equal every instance of dog plus every isntance of cat
        pets.each do |pet| #intereate over each instance of both animals and for each pet "do"
          pet.owner = nil #set every sintance of pet owner to equal inl and every pet's mood to = nervous
          pet.mood = "nervous"
        end 
        

      end 

      def list_pets
        "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
      end 


  end 






end 