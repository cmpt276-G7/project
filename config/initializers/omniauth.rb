Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret'], {:scope => 'user_about_me'}
  provider :twitter, TWITTER_CONFIG['app_id'], TWITTER_CONFIG['secret']
end
