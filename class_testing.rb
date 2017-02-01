class Person
  attr_accessor :name
  attr_reader :age
  @@num_of_persons = 0

  def initialize(name, age)
    @name = name
    @age = age
    @@num_of_persons += 1
  end

  def walk
    puts "#{@name} is walking."
  end

  def is_old?
    @age > 40
  end

  def self.count_of
    puts "This only works when called on class."
    puts "#{@@num_of_persons} Person class has been created so far."
  end
end
