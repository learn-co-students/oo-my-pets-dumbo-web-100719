class Dog
  # code goes here
  attr_accessor :mood, :owner
  attr_reader :name
  #initialize name as well as not have it be able 
  #to change
  @@all = []
  def initialize(name, owner = @owner, mood = "nervous")

    @name = name
    @owner = owner
    @mood = mood
    @@all << self
  end

  def self.all
    @@all
  end



end