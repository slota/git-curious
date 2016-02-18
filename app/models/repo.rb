class Repo
  attr_reader :starred_repos, :repos
  #
  def initialize(current_service)
    @starred_repos = current_service.starred_repos
    @repos         = current_service.repos
  end

  def starred_repo_names
    starred_repos.map { |object| object["name"] }
  end

  def names
    repos.map { |object| object["name"] }
  end
end
