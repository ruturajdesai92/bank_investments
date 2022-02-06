class AccountsController < ApplicationController
    def index
        accounts_details
    end

    def invest
        mf_investment = MfInvestmentService.new(params["amount"].to_i)
        @logs = mf_investment.invest
        accounts_details
        render partial: "accounts/tables/accounts_table"
    end

    def reset
        Account.insert_accounts_details
        accounts_details
        render partial: "accounts/tables/accounts_table"
    end

    private
    def accounts_details
        @accounts = Account.all
    end
end