class Account
  attr_accessor :balance, :name

  def initialize(starting_balance, name)
    @balance = starting_balance
    @name = name
  end

  def deposit(amount)
    @balance += amount
    puts "==========================="
    puts "You have deposited #{amount}.\n"
  end

  def withdraw(amount)
    if amount <= @balance
      @balance -= amount
      puts "==========================="
      puts "You have withdrawn #{amount}\n"
    else
      puts "==========================="
      puts "dude you don't have that much money.\n"
    end
  end
end
