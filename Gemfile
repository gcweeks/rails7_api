source 'https://rubygems.org'

ruby '>= 3.1.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.5'
# Use Puma as the app server
gem 'puma', '>= 6.4'
# Use Passenger as the app server
# gem 'passenger', '~> 6.0'
# Use Redis for caching and rate limiting
gem 'redis', '>= 4.0', '< 6.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.20'

# Boot time performance
gem 'bootsnap', require: false

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Twilio SMS integration
gem 'twilio-ruby', '~> 7.3'
# AWS SES for email
gem 'aws-ses', '~> 0.6.0', require: 'aws/ses'
# Rack Attack for rate limiting
gem 'rack-attack', '~> 6.7'
# Slack Notifications
gem 'slack-notifier', '~> 2.4'
# Exception Notifications
gem 'exception_notification', '~> 4.5'
# attr_encrypted for sensitive data
gem 'attr_encrypted', '~> 4.0'

group :development, :test do
  # HTTP request mocking
  gem 'webmock', '~> 3.24'
  # Debugging
  gem 'debug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # File system event monitoring
  gem 'listen', '~> 3.9'
  # Spring speeds up development by keeping your application running in the background
  # Note: Spring is optional in Rails 7+, consider removing if not needed
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.1'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  # gem 'capybara'
  # gem 'selenium-webdriver'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

