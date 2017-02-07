load 'account.rb'
require 'yaml'
require 'colorize'

class Interface

  attr_accessor :cust

  def initialize
    @cust = nil
    start_menu
  end

  def start_menu
    puts `clear`
    puts "="*40
    puts "Please select from one of the options:"
    puts "1. Create new account"
    puts "2. Log in existing account"
    puts "3. Quit program"
    puts "="*40
    print "> "
    choice = gets.chomp.to_i
    case choice
    when 1
      create_account
    when 2
      log_in
    when 3
      exit
    end
  end

  # def get_user_info
  #   puts "Please input your name."
  #   print "> "
  #   name = gets.chomp.downcase
  #   puts "Your 4 digit pin please:"
  #   print "> "
  #   pin = gets.chomp.to_i
  #   return name, pin
  # end

  def log_in
    # check user_data name and pin match
    puts "Existing user, please input your name."
    print "> "
    user_name = gets.chomp.downcase
    retrieve_user_file(user_name)
    puts "Your 4 digit pin please:"
    print "> "
    user_pin = gets.chomp.to_i
    begin
      @cust.pin == user_pin
    rescue
      puts "No such file, unable to compare."
      sleep(2)
      start_menu
    else
      if @cust.pin == user_pin
        menu
      else
        puts "Incorrect pin entered. Returning to start menu.."
        sleep(2)
        start_menu
      end
    end
  end

  def menu
    #will exit when user inputs invalid option?
    puts `clear`
    puts "="*40
    puts "Welcome #{@cust.name.capitalize}"
    puts "What would you like to do today?"
    puts "1. Deposit cash"
    puts "2. Withdraw cash"
    puts "3. Check remaining balance"
    puts "4. Check transaction history"
    puts "5. Return to start menu"
    puts "6. Quit"
    puts "="*40
    print "Your choice: "
    user_choice = gets.chomp.to_i
    case user_choice
    when 1
      deposit_m
    when 2
      withdraw_m
    when 3
      check_balance
    when 4
      transaction_history
    when 5
      start_menu
    when 6
      save_data
      puts "#{Account.count_account} accounts set up in this session.."
      print "Saving data and quitting program"
      sleep(0.5)
      print "."
      sleep(0.5)
      print "."
      sleep(0.5)
      print "."
      exit
    end
  end

  def deposit_m
    puts "Please input amount to deposit"
    print "> "
    amount = gets.chomp.to_i
    if amount < 0
      puts "Please input a positive number.".red
    else
      @cust.deposit(amount)
    end
    puts "Press <ENTER> to return to menu.."
    gets
    menu
  end

  def withdraw_m
    puts "Please input amount to withdraw"
    print "> "
    amount = gets.chomp.to_i
    if amount < 0
      puts "Please input a positive number.".red
    elsif @cust.balance < amount
      puts "Transaction denied. Insufficient funds.".red
    else
      @cust.withdraw(amount)
    end
    puts "Press <ENTER> to return to menu.."
    gets
    menu
  end

  def create_account
    puts "what is your name?"
    name = gets.chomp
    puts "A 4 digit pin please"
    pin = gets.chomp.to_i
    todays_date = Time.now.strftime("%d/%m/%Y %H:%M")
    if File.exist?("#{name}_account_info.yml")
      puts "Name is taken. Please choose another name.".red
      puts "Press <ENTER> to continue"
      gets
      start_menu
    else
      @cust = Account.new(name, todays_date, pin)
      menu
    end
  end

  def check_balance
    #move to account class?
    puts "="*40
    puts "Your current balance is: $#{@cust.balance}".green
    puts "="*40
    puts "Press <ENTER> to return to menu.."
    gets
    menu
  end

  def transaction_history
    #move to account class?
    txn = @cust.transactions
    puts "-"*100
    puts printf("%-8s %-23s %-30s", "No.","Timestamp","Message")
    txn.each do |each_txn|
      puts each_txn
    end
    puts "-"*100
    puts "Press <ENTER> to return to menu.."
    gets
    menu
  end

  def retrieve_user_file(user_name)
    if File.exist?("#{user_name}_account_info.yml")
      @cust = YAML.load(File.open("#{user_name}_account_info.yml"))
    else
      puts "Unable to log in. User: #{user_name} does not exist."
      sleep(2)
      start_menu
    end
  end

  def save_data
    File.open("#{@cust.name}_account_info.yml", "w"){|f| f.write(@cust.to_yaml)}
  end
end
