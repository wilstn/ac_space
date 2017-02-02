require "yaml"

class BankAccount

  def initialize
    @your_account = []
    load_account_details
  end

  def load_account_details
    unless File.exists?("accountinfo.yml")
      File.new("accountinfo.yml", "w+")
    end
    @your_account = YAML.load_file("accountinfo.yml")
  end

  def save_account_details
    first_name = "Tim"
    last_name = "Knight"
    address = "356 Street"
    @your_account = [first_name, last_name, address]

    File.open("accountinfo.yml", "r+") do |f|
      f.write(@your_account.to_yaml)
    end
  end

end
