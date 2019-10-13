class Dog

  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []
  
  def initialize (dog_name, owner_instance)
    @name = dog_name
    @owner = owner_instance
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end
end