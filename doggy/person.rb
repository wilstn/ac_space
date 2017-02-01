class Person

  def initialize(name, dog)
    @name = name
    @dog = dog
  end

  def make_bark
    puts "#{@name} is asking #{@dog.d_name} to bark."
    @dog.bark
  end
end
