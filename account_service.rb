module BillingAdapterInterface
  class AccountService
    def create(account_dto)
      raise("This call must be provided by a billing service adapter (i.e. PayMeAdapter)")
    end

    def update(account_dto)
      raise("This call must be provided by a billing service adapter (i.e. PayMeAdapter)")
    end
  end
end


module PayMeAdapter
  class AccountService < BillingAdapterInterface::AccountService
    def create(account_dto)
      pay_me_user_client = PayMeGem::User.new
      user = pay_me_user_client.new
      user.id = account_dto.account_id
      user.full_name = account_dto.account_name
      unless user.save
        account_dto.errors << user.errors.first
      end

      account_dto
    end

    def update(account_dto)
      # mentally insert something that looks like reasonable code...
    end
  end
end
