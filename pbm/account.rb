class Account
  attr_accessor :balance, :name, :transactions

  def initialize(starting_balance, name, transactions=[])
    @balance = starting_balance
    @name = name
    @transactions = transactions
    @txn_count = 0
  end

  def deposit(amount)
    @balance += amount
    puts "==========================="
    puts "You have deposited #{amount}.\n"
    @transactions << "#{@txn_count += 1}. You have deposited #{amount}."
  end

  def withdraw(amount)
    if amount <= @balance
      @balance -= amount
      puts "==========================="
      puts "You have withdrawn #{amount}\n"
      @transactions << "#{@txn_count += 1}. You have withdrawn #{amount}."
    else
      puts "==========================="
      puts "Insufficient funds.\n"
      @transactions << "#{@txn_count += 1}. Tried to withdraw #{amount} but insufficient balance."
    end
  end
end
