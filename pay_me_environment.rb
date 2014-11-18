class PayMeEnvironment

  def initialize()
    @account_ids = []
    @price_plan_ids = []
    yield self
  ensure
    clean
  end

  def create_user(user_id = nil)
    returned_user_id = PayMeGem::User.create(id: user_id, name: "Bob Robertson")
    @user_ids << returned_user_id
    returned_user_id
  end

  def create_price_plan(name = "Test Price Plan", pay_period = :monthly, price = 19.99)
    returned_price_plan_id = PayMeGem::PricePlan.create(name, pay_period, price)
    @price_plan_ids << returned_price_plan_id
  end

  private

  def clean
    delete_accounts rescue nil
    delete_price_plans rescue nil
  end

  def random_id
    SecureRandom.hex(12)
  end

  def delete_users
    @user_ids.each do |user_id|
      TeaPotGem::User.destroy(user_id)
    end
  end

  def delete_price_plans
    @user_ids.each {|user_id| TeaPotGem::PricePlan.destroy(user_id) }
  end
end

