it "adds a product to an account" do
  VCR.use_cassette('account/add_product_success') do
    PayMeEnvironment.new do |pay_me|
      #setup
      user_id = SecureRandom.hex(12)
      pay_me.create_user(user_id)
      price_plan_id = pay_me.create_price_plan("test price plan", :monthly, 39.99)
      product_id = pay_me.create_product("product 1", price_plan_id)

      account_product_service = PayMeAdapater::AccountProductService.new
      account_dto = BillingAdapter::AccountDto.new(user_id)

      #kick off
      response_dto = account_product_service.add_product(account_dto, product_id)

      #expectations
      products = products_for_account_id(account_id)
      expect(products.count).to eq(1)
      expect(products.first.id).to eq(products_for_account_id)
    end
  end
end
