class Account
  attr_accessor :balance, :name

  def initialize(starting_balance, name)
    @balance = starting_balance
    @name = name
  end

  def deposit(amount)
    @balance += amount
    puts "You have deposited #{amount}."
    puts "Your current balance is #{@balance}."
  end

  def withdraw(amount)
    if amount <= @balance
      @balance -= amount
      puts "You have withdrawn #{amount}"
      puts "Your current balance is #{@balance}."
    else
      puts "dude you don't have that much money."
    end
  end
end
