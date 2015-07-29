Wirecard.configure do |config|
  config.customer_id = 'D200001'
  config.shop_id = 'qmore'
  config.secret = 'B8AKTPWBRMNBV455FG6M2DANE99WU2'
  
  # optional
  # config.endpoint = 'https://checkout.wirecard.com/seamless'
  # config.host = 'checkout.wirecard.com'
  # config.success_url = 'http://localhost.success.url'
  # config.failure_url = 'http://localhost.failure.url'
  # config.cancel_url = 'http://localhost.cancel.url'
  # config.service_url = 'http://localhost.service.url'
  # config.confirm_url = 'http://localhost.confirm.url'
  # config.return_url = 'http://localhost.return.url'
  # config.language = I18n.default_locale[0..1]
end