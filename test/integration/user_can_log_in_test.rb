require 'test_helper'
require 'capybara'

class UserCanLogInTest < ActionDispatch::IntegrationTest
  def setup
    binding.pry
    stub_omniauth
  end

  test 'user can log in and see data' do
    visit root_path
    click_on("Login")
save_and_open_page
    assert page.has_content? "slotaj"
    binding.pry
  end
end
