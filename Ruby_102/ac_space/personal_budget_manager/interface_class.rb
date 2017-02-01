load 'account_class.rb'
class Interface
  attr_accessor :account

  def initialize
    show_menu
    @account = create_account
  end

  def show_menu
    puts "Press 1 to display your current balance\nPress 2 to Deposit\nPress 3 to Withdraw\nPress 0 to Exit"
    user_input = gets.chomp
  end

  def add_balance
    puts "Enter amount to be added."
    balance_to_be_added  = gets.chomp
    @account.deposit(balance_to_be_added)
  end

  def withdraw_balance
    puts "Please enter your amount you'd like to withdraw."
    balance_to_be_withdrawn = gets.chomp
    @account.withdraw(balance_to_be_withdrawn)
  end

  def show_balance
    print "Your balance is $#{@account.balance}"
  end

  def create_account
    puts "What is your name?"
    name = gets.chomp
    puts "What's your starting balance?"
    starting_balance = gets.chomp
    cust_account = Account.new(starting_balance, name)
  end

#   def save_data
#     #save the account information in a yaml file
#   end
#
#   def load_data
#     #check if there is a yaml file
#     #if there is, load from there
#     #if not, create a new yaml file to store the account data
#   end
end
