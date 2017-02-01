class Dog
  attr_accessor :age, :breed,:name, :gender
  def initialize(name,age,breed,gender)
    @name = name
    @age = age
    @breed = breed
    @gender = gender
  end

  def speak()
    puts "#{name} : woof woof!"
  end
end
