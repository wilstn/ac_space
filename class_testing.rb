class Person
  attr_accessor :name
  attr_reader :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end
