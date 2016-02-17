ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'webmock'
require 'vcr'

class ActiveSupport::TestCase

  OmniAuth.config.test_mode = true
  omniauth_hash = { 'provider' => 'twitter',
                    'uid' => '12345',
                    'info' => {
                        'name' => 'carl',
                        'description' => 'Angry neighor with inflatable pool',
                        'image' => 'http://pbs.twimg.com/profile_images/676288331215335424/xFUgQmzk_normal.jpg'
                    },
                    'credentials' => {
                        'token' => '3767014753-pzD4G6hhmyH0dHEBNODBJrQqhYHbG0WCl2QRxEc',
                        'secret' => 'uFPYL5mO17PK5IDtBvvEVRH1H5YmC99XF2eGlmoJmTRUE'
                    }
  }

  OmniAuth.config.add_mock(:twitter, omniauth_hash)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into :webmock
  end
end
