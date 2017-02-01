class Human
  attr_accessor :name, :dog
  def initialize(name,dog)
    @name = name
    @dog = dog
  end

  def make_dog_speak()
    puts "#{@name} : #{@dog.name} , Please speak boy!"
    @dog.speak
  end
end
