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
  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({'provider' => 'github',
      'uid' => '12905774',
      'info' => {
        'name' => 'jesus',
        'email' => 'john.slota@gmail.com',
        'nickname' => 'carmer'
      },
      'credentials' => {
        'token' => 12312
        }})
  end


  include Capybara::DSL

  def teardown
    reset_session!
  end
end
