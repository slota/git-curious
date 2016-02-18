class GitHubService
  attr_reader :connection, :nickname, :current_user

  def initialize(current_user)
    @current_user = current_user
    @connection = Faraday.new(url: "https://api.github.com")
    # connection.headers['access_token'] = current_user.token
  end

  def user(current_user)
    parse(connection.get("/users/#{current_user.nickname}"))
  end

  def repos
    JSON.parse(connection.get("/user/repos", {access_token: current_user.token}).body)
  end

  def all_repos(user)
    parse(connection.get("/users/#{user}/repos?type=owner"))
  end

  def starred_repos
    # JSON.parse(Faraday.new(url: "https://api.github.com").get("/user/starred", {access_token: current_user.token}).body)
    JSON.parse(connection.get("/user/starred", {access_token: current_user.token}).body)
  end

  def followers
    JSON.parse(connection.get("/user/followers", {access_token: current_user.token}).body)
  end

  def following
    JSON.parse(connection.get("/user/following", {access_token: current_user.token}).body)
  end

  def organizations
    JSON.parse(connection.get("/user/memberships/orgs", {access_token: current_user.token}).body)
  end

  def comments(repo)
    binding.pry
    JSON.parse(connection.get("/repos/#{current_user.nickname}/#{repo}/comments", {access_token: current_user.token}).body)
  end

  private

  # def parse(response)
  #   JSON.parse(response.body)
  # end

end