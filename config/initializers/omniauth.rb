
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '196463371068934', 'b827108e2e368832bc0a6d42f905b704
'end