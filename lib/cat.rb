class Cat
  # code goes here
  attr_accessor :mood, :owner 
  attr_reader :name
  
  @@all = []
  def initialize(name, owner = @owner, mood = "nervous")

    @name = name
    @owner = owner
    @mood = mood
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end


end