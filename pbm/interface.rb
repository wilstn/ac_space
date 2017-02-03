load 'account.rb'
require 'yaml'

class Interface

  def initialize
    create_account
    @cust_account = create_account

    if File.exist?("account_info.yml")
      load_data
    else
      create_account
      @cust_account = create_account
    end
  end

  def show_menu
    puts "===========================
    \nPress 1 to display balance
    \nPress 2 to Deposit
    \nPress 3 to Withdraw
    \nPress 4 to view transactions
    \nPress any other key to exit."
    print ">> "
    user_input = gets.chomp.to_i
    if user_input == 1
      show_balance
    elsif user_input == 2
      add_balance
    elsif user_input == 3
      withdraw_balance
    elsif user_input == 4
      show_transactions
    else
      puts "Exiting program."
      exit
    end
  end

  def add_balance
    puts "Enter amount to be added."
    balance_to_be_added  = gets.chomp.to_i
    @cust_account.deposit(balance_to_be_added)
    save_data
    show_menu
  end

  def withdraw_balance
    puts "Please enter your amount you'd like to withdraw."
    balance_to_be_withdrawn = gets.chomp.to_i
    @cust_account.withdraw(balance_to_be_withdrawn)
    save_data
    show_menu
  end

  def show_balance
    puts "==========================="
    print "Your balance is $#{@cust_account.balance}\n"
    show_menu
  end

  def show_transactions
    puts "----Txn Start----"
    @cust_account.transactions.each do |line|
      puts line
    end
    puts "-----Txn End-----"
    puts "Press <enter> to continue."
    gets
    show_menu
  end

  def create_account
    puts "What is your name?"
    name = gets.chomp
    puts "What's your starting balance?"
    starting_balance = gets.chomp.to_i
    @cust_account = Account.new(starting_balance, name)
    save_data
    show_menu
  end

  def save_data
    client_data = {"name" => @cust_account.name, "balance" => @cust_account.balance, "transactions" => @cust_account.transactions}
    File.open("account_info.yml", "w"){|f| f.write(client_data.to_yaml)}
  end

  def load_data
    existing_account = YAML.load(File.open("account_info.yml")) if File.exist?("account_info.yml")
    @cust_account = Account.new(existing_account["balance"], existing_account["name"], existing_account["transactions"])
    puts "==========================="
    puts "Welcome back #{@cust_account.name}"
    show_menu
  end
end
