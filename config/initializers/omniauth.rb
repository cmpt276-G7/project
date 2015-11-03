Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'mHyKkFea4Tp6pQUKPuV14xYFh', 'pX0b7hq0u7B6kLWAEHxtt2Gs56dKRJ7NZPsNcOWnvm6LpbfIfE'
  provider :facebook, '531440427013867', '69c5b70fa883b33d5c49f425cf8eda75'
  provider :github, '7ef39444e08b7109420b', '95b7fa928c434859330a09d9983b77bfd9bcd657'
end