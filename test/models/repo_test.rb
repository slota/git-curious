require 'test_helper'

class RepoTest < ActiveSupport::TestCase
  def setup
    VCR.use_cassette('repo_model') do
      user = users(:one)
      current_service = GitHubService.new(user)
      @repos = Repo.new(current_service)
    end
  end

  test 'starred_repo_names works as expected' do
    assert_equal @repos.starred_repo_names, ["gitcommit", "enigma", "chisel_project"]
  end

  test 'next repo model' do
    assert_equal @repos.names.first, "slota-shop"
    assert_equal @repos.names.last, "posse_challenges"
  end
end
