PayMeAdapter::Configuration.instance.configure(ENV["PAY_ME_URI"],
                                               ENV["PAY_ME_TOKEN"])

BillingApp::Configuration.configure do |config|
  config.account_service = PayMeAdapter::AccountService
  config.payment_method_service = PayMeAdapter::PaymentMethodService
end



# Anywher in the main app where you want to call it.
Configuration.instance.payment_method_service