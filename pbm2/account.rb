require 'colorize'
class Account
  attr_accessor :name, :open_date, :balance, :transactions
  attr_reader :account_no, :pin

  @@account_no = 0

  def initialize(name, open_date, pin)
    @@account_no += 1
    @name = name.downcase
    @open_date = open_date
    @pin = pin
    @balance = 0
    @transactions = []
    @txn_no = 0
  end

  def self.count_account
    @@account_no
  end

  def deposit(amount)
    self.balance += amount
    puts "="*20
    puts "You have deposited $#{amount}".green
    puts "="*20
    self.transactions << "Txn #{@txn_no += 1}.\t #{Time.now.strftime("%d/%m/%Y %H:%M")}\t You have deposited $#{amount}\t\t Remaining balance: #{@balance}"
  end

  def withdraw(amount)
    self.balance -= amount
    puts "="*20
    puts "You have withdrawn $#{amount}".green
    puts "="*20
    self.transactions << "Txn #{@txn_no += 1}.\t #{Time.now.strftime("%d/%m/%Y %H:%M")}\t You have withdrawn $#{amount}\t\t Remaining balance: #{@balance}"
  end

end
