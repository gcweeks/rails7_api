# Rails 7 API Starter Pack

A modern, production-ready Rails 7.2 API template with authentication, third-party integrations, and security best practices.

## Tech Stack

- **Ruby** 3.3.6
- **Rails** 7.2.3
- **PostgreSQL** with UUID primary keys
- **Redis** for caching and rate limiting
- **Puma** 6.4+ web server

## Features

### Core Features
* **API-only Rails application** with versioned routes (`/v1`)
* **PostgreSQL database** with UUID primary keys (view config/database.yml for setup)
* **Redis integration** for caching and rate limiting
* **Route versioning** for API stability
* **Zeitwerk autoloading** (Rails 6+ default)
* **Bootsnap** for faster boot times

### Authentication & Security
* **User authentication** with email, password, phone, and DOB
* **Token-based auth** (Bearer token in Authorization header)
* **Password reset flow** with 10-minute token expiry
* **Password validation**: 9+ characters, checked against 5,151 common passwords
* **Email validation** with format checking
* **Phone validation** (10 digits required)
* **BCrypt encryption** (cost factor 11) for passwords
* **Rate limiting** via Rack::Attack:
  - 300 requests per 5 minutes per IP
  - 5 login attempts per 20 seconds per IP
  - 5 login attempts per 20 seconds per email
* **Authentication event logging** (IP address, success/failure)

### Third-Party Integrations
* **AWS SES** for transactional emails (password reset, welcome emails)
* **Firebase Cloud Messaging (FCM)** for push notifications
* **Twilio** for SMS messaging with confirmation codes
* **Slack** notifications for:
  - Error and exception reporting
  - User support messages
  - Rate limiting alerts

### Testing
* **Minitest** test framework with fixtures
* **WebMock** for HTTP request stubbing
* Comprehensive test coverage for models and controllers

### Additional Features
* **attr_encrypted** gem available for encrypting sensitive model fields
* **Webhook handling** for Twilio SMS responses
* **Support ticket system** via Slack integration
* **Version check endpoints** for iOS and Android clients

## Quick Start

### Prerequisites
- Ruby 3.1+ (3.3.6 recommended)
- PostgreSQL 9.1+
- Redis

### Installation

1. Clone the repository:
```bash
git clone <your-repo-url>
cd rails7_api
```

2. Install dependencies:
```bash
bundle install
```

3. Set up the database:
```bash
# Configure PostgreSQL (see config/database.yml for details)
# Create a role and database:
sudo su - postgres
psql
CREATE ROLE somecompany WITH CREATEDB SUPERUSER LOGIN PASSWORD 'Abcde_12345';
\q

# Set up the database
rails db:setup
rails db:migrate
```

4. Configure environment variables (see Environment Variables section below)

5. Start the server:
```bash
rails server
```

The API will be available at `http://localhost:3000`

## Environment Variables

Required environment variables for production:

```bash
# Security
SALT=<your-salt-for-sms-confirmation>

# Database (Production)
RDS_DB_NAME=<database-name>
RDS_USERNAME=<database-username>
RDS_PASSWORD=<database-password>
RDS_HOSTNAME=<database-host>
RDS_PORT=<database-port>

# Redis
REDIS_HOST=<redis-hostname>  # Defaults to localhost in development

# AWS SES
AWS_ACCESS_KEY_ID=<your-aws-access-key>
AWS_SECRET_ACCESS_KEY=<your-aws-secret-key>

# Twilio
TWILIO_SID=<your-twilio-account-sid>
TWILIO_TOKEN=<your-twilio-auth-token>

# Firebase Cloud Messaging
FIREBASE_KEY=<your-firebase-server-key>

# Slack
SLACK_ROUTE=<webhook-url-for-support-messages>
SLACK_EXCEPTIONS_ROUTE=<webhook-url-for-error-notifications>

# Rails (Optional)
RAILS_LOG_TO_STDOUT=true
RAILS_SERVE_STATIC_FILES=true
```

## API Endpoints

### Public Endpoints (No authentication required)

#### Echo & Testing
- `GET /v1/` - Echo "GET Request"
- `POST /v1/` - Echo request body

#### Authentication
- `GET /v1/auth` - Login with email/password (returns user with token)
- `POST /v1/reset_password` - Initiate password reset
- `PUT /v1/update_password` - Complete password reset with token

#### User Management
- `POST /v1/users` - Create new user account
- `GET /v1/check_email` - Check if email exists

#### Versioning
- `GET /v1/version/ios` - Get iOS app version
- `GET /v1/version/android` - Get Android app version

#### Webhooks
- `POST /v1/webhooks/twilio` - Receive Twilio SMS webhooks

### Protected Endpoints (Requires Bearer token in Authorization header)

#### User Profile
- `GET /v1/users/me` - Get authenticated user profile
- `PUT /v1/users/me` - Update user profile

#### Notifications
- `POST /v1/users/me/register_push_token` - Register FCM device token
- `POST /v1/users/me/dev_notify` - Send test push notification (development)
- `POST /v1/users/me/dev_email` - Send test welcome email (development)

#### Support
- `POST /v1/users/me/support` - Send support message to Slack

## Database Schema

### Users
- UUID primary key
- Email (unique, validated)
- Password (BCrypt hashed, min 9 chars, complexity validated)
- Phone (10 digits required)
- First name, Last name
- Date of birth
- Authentication token
- Password reset token and expiry
- Timestamps

### Auth Events
- UUID primary key
- User reference
- IP address (PostgreSQL inet type)
- Success boolean
- Timestamps

### FCM Tokens
- UUID primary key
- User reference
- Firebase Cloud Messaging device token
- Timestamps

## Testing

Run the full test suite:
```bash
rails test
```

Run specific tests:
```bash
rails test test/models/user_test.rb
rails test test/controllers/v1/users_controller_test.rb
```

## CORS Configuration

CORS is currently disabled. To enable cross-origin requests (e.g., from a frontend app):

1. Add to Gemfile: `gem 'rack-cors'`
2. Edit `config/initializers/cors.rb` and uncomment the configuration
3. Update allowed origins to match your frontend domain(s)
4. Restart the server

## Production Deployment

### Security Checklist
- [ ] Set all environment variables
- [ ] Configure allowed CORS origins (if needed)
- [ ] Set up SSL/HTTPS
- [ ] Configure host authorization in production.rb
- [ ] Review and adjust rate limiting rules
- [ ] Set up database backups
- [ ] Configure log aggregation
- [ ] Set up monitoring (New Relic, Datadog, etc.)

### Performance
- Bootsnap is enabled for faster boot times
- PostgreSQL connection pooling configured (RAILS_MAX_THREADS)
- Redis caching for rate limiting
- Eager loading enabled in production

## License

MIT License - see LICENSE file for details

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes with tests
4. Submit a pull request

## Upgrade Notes

This template was recently upgraded from Rails 5.1 to Rails 7.2. Key changes:
- Ruby version requirement increased to 3.1+
- Zeitwerk autoloading (replaces classic autoloader)
- Modern gem versions (Puma 6.4+, Postgres 1.5+, etc.)
- Rails 7.2 configuration defaults
- Updated test configuration for Rails 7
- attr_encrypted updated to 4.x (see gem documentation for breaking changes)

## Support

For issues or questions:
- Create an issue in the repository
- Check existing tests for usage examples
- Review inline code comments for specific integrations
