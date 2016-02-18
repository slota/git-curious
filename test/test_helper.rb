require 'simplecov'
SimpleCov.start
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest-vcr'
require 'vcr'
require 'webmock'
require 'capybara/rails'
require 'minitest/pride'

class ActiveSupport::TestCase
  fixtures :all
  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into :webmock
    config.allow_http_connections_when_no_cassette = true
  end
  MinitestVcr::Spec.configure!


end




class ActionDispatch::IntegrationTest
  OmniAuth.config.test_mode = true
  omniauth_hash = { 'provider' => 'github',
    'uid' => '12905774',
    'info' => {
      'name' => 'John Slota',
      'email' => 'john.slota@gmail.com',
      'nickname' => 'slotaj'
    },


  }

  OmniAuth.config.add_mock(:github, omniauth_hash)

  class IntegrationTest
    include Capybara::DSL

    def teardown
      reset_session!
    end
  end
end
