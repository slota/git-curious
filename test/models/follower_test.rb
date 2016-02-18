require 'test_helper'

class FollowerTest < ActiveSupport::TestCase
  def setup
    VCR.use_cassette('follower_model') do
      user = users(:one)
      current_service = GitHubService.new(user)
      @followers = Follower.new(current_service)
    end
  end

  test 'followers works correctly' do
    assert_equal @followers.names.first, "amcrawford"
  end
end
