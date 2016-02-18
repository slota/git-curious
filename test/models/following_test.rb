require 'test_helper'

class FollowingTest < ActiveSupport::TestCase
  def setup
    VCR.use_cassette('following_model') do
      user = users(:one)
      current_service = GitHubService.new(user)
      @following = Following.new(current_service)
    end
  end

  test 'following works correctly' do
    assert_equal @following.names.first, "jcasimir"
  end
end
