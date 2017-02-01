load 'account_class.rb'

class Interface
  attr_accessor :account

  def initialize
    show_menu
    @account = create_account
  end

  def show_menu
    puts "Menu would be shown here."

  end

  def add_balance
    puts "Enter amount to be added."
    balance_to_be_added  = gets
    @account.add(balance_to_be_added)
  end

  def withdraw_balance
  end

  def show_balance
  end

  def create_account
    puts "Ask for data needed to open an account"
    #get data for name and assign into variable
    # @account = Account.new(name, balance)
    puts @account.inspect
  end

  def save_data
    #save the account information in a yaml file
  end

  def load_data
    #check if there is a yaml file
    #if there is, load from there
    #if not, create a new yaml file to store the account data
  end
end
