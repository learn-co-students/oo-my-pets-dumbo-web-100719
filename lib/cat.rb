require "pry"
class Cat
  attr_accessor :owner, :mood
  attr_reader :name
  
  @@all = []
  def initialize(cat_name, owner_instance)
    @name = cat_name
    @owner = owner_instance
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end

end