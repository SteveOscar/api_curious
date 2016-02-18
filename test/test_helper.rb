require "simplecov"
SimpleCov.start "rails"

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "capybara/rails"
require 'minitest/pride'
require 'webmock'
require 'vcr'
require "minitest-vcr"
require 'mocha/mini_test'

class ActiveSupport::TestCase


  OmniAuth.config.test_mode = true
  omniauth_hash = { 'provider' => 'twitter',
                    'uid' => '12345',
                    'info' => {
                        'name' => 'Steven Olson',
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

  # VCR config
  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into :webmock
    config.allow_http_connections_when_no_cassette = true
  end
  MinitestVcr::Spec.configure!

end

module ActionDispatch
  class IntegrationTest
    include Capybara::DSL

    def teardown
      reset_session!
    end
  end
end
