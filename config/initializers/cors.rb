# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

# CORS is currently disabled. Uncomment and configure the following to enable:
#
# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     # Update this to match your frontend domain(s)
#     origins 'localhost:3001', 'example.com'
#
#     resource '*',
#       headers: :any,
#       methods: [:get, :post, :put, :patch, :delete, :options, :head],
#       credentials: true
#   end
# end
#
# Note: You'll also need to add the rack-cors gem to your Gemfile:
# gem 'rack-cors'
