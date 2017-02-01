class Account
  attr_accessor :balance, :name

  def initialize(starting_balance, name)
    @balance = starting_balance
    @name = name
  end

  def deposit(balance)
    puts "Do deposit here"
  end

  def withdraw(balance)
    puts "Do withdraw here"
  end
end
