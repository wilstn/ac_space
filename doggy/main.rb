load 'person.rb'
load 'dog.rb'

doggy1 = Dog.new("doggy1_name")
person1 = Person.new("John", doggy1)

person1.make_bark
