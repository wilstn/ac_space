load "dog.rb"
load "human.rb"

jimmy = Dog.new("jimmy", "2", "chiwawa", "female")
paul = Human.new("paul", jimmy)
paul.make_dog_speak
