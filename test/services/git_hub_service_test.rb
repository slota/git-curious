require 'test_helper'

class GitHubServiceTest < ActiveSupport::TestCase
  test '#repos' do
    VCR.use_cassette('repo_service') do
      user = users(:one)
      current_service = GitHubService.new(user)
      repos = current_service.repos

      refute repos.nil?
      assert_equal repos.count, 30
    end
  end

  test '#starred_repos' do
    VCR.use_cassette('starred_repo_service') do
      user = users(:one)
      current_service = GitHubService.new(user)
      starred_repos = current_service.starred_repos

      refute starred_repos.nil?
      assert_equal starred_repos.count, 3
    end
  end

  test '#followers' do
    VCR.use_cassette('follower_service') do
      user = users(:one)
      current_service = GitHubService.new(user)
      followers = current_service.followers

      refute followers.nil?
      assert_equal followers.count, 15
    end
  end

  test '#following' do
    VCR.use_cassette('following_service') do
      user = users(:one)
      current_service = GitHubService.new(user)
      following = current_service.following

      refute following.nil?
      assert_equal following.count, 24
    end
  end

  test '#organizations' do
    VCR.use_cassette('organizations_service') do
      user = users(:one)
      current_service = GitHubService.new(user)
      organizations = current_service.organizations

      refute organizations.nil?
      assert_equal organizations.count, 1
    end
  end

  test '#commits' do
    VCR.use_cassette('commits_service') do
      user = users(:one)
      current_service = GitHubService.new(user)
      commits = current_service.commits("git-curious")

      refute commits.nil?
      assert_equal commits.count, 7
    end
  end

  test '#events' do
    VCR.use_cassette('events_service') do
      user = users(:one)
      current_service = GitHubService.new(user)
      events = current_service.events

      refute events.nil?
      assert_equal events.count, 30
    end
  end
end
