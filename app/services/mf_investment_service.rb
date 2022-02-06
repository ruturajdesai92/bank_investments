class MfInvestmentService
    def initialize(amount)
        @amount = amount
    end

    def invest
        logs = []
        while @amount > 0
            account = nearest_bank_account
            break if account.blank?
            if account.balance >= @amount
                account.balance -= @amount
                logs << "Deducted #{@amount} from account #{account.name}"
                @amount = 0
            else
                @amount -= account.balance
                logs << "Deducted #{account.balance} from account #{account.name}"
                account.balance = 0
            end
            account.save!
        end

        logs << "Failed to invest #{@amount}" if @amount > 0
        logs
    end

    private
    def nearest_bank_account
        Account.where.not(balance: 0).order(Arel.sql("abs(accounts.balance - #{@amount})")).first
    end
end