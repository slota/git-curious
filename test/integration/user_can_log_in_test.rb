require 'test_helper'
require 'capybara'

class UserCanLogInTest < ActionDispatch::IntegrationTest
  def setup
    OmniAuth.config.mock_auth[:github]
  end
  test 'user can log in and see data' do
    visit root_path
    click_on("Login")
    assert page.has_content? "slotaj"
  end
end
