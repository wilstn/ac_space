class Dog

  attr_reader :d_name

  def initialize(d_name)
    @d_name = d_name
  end

  def bark
    puts "#{@d_name} is barking.."
  end

end
