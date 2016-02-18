require 'test_helper'

class CommitTest < ActiveSupport::TestCase
  def setup
    VCR.use_cassette('commit_model') do
      user = users(:one)
      current_service = GitHubService.new(user)
      @commit = Commit.new(current_service, "git-curious")
    end
  end

  test 'commit works correctly' do
    assert_equal @commit.comments.first, "all faraday endpoints being tested"
  end
end
