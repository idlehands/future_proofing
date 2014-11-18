module BillingAdapterInterface
  class AccountDto
    attr_reader :account_id, :account_name
    attr_accessor :errors, :result

    def initialize(account_id, account_name)
      @account_id = account_id
      @account_name = account_name
      @errors = []
      @results = {}
      validate_attributes
    end

    def success?
      @errors.size == 0
    end

    private

    def validate_attributes
      validate_account_id
      validate_account_name
    end

    def validate_account_id
      unless @account_id.is_a?(Integer)
        @errors << "account_id must be an integer"
      end
    end

    def validate_account_name
      unless @validate_account_name.is_a?(String)
        @errors << "account_name must be a string."
      end
    end
  end
End
