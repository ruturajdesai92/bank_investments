class Account < ApplicationRecord
  def self.insert_accounts_details
    self.find_or_create_by(name: "Account1").update(balance: 10000)
    self.find_or_create_by(name: "Account2").update(balance: 5000)
    self.find_or_create_by(name: "Account3").update(balance: 25000)
    self.find_or_create_by(name: "Account4").update(balance: 15000)
    self.find_or_create_by(name: "Account5").update(balance: 12000)
  end
end