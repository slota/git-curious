require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  def setup
    VCR.use_cassette('organization_model') do
      user = users(:one)
      current_service = GitHubService.new(user)
      @organization = Organization.new(current_service)
    end
  end
  #
  test 'organization works correctly' do
    assert_equal @organization.names.first, "team-slota"
  end
end
