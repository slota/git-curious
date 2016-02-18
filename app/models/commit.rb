class Commit
  attr_reader :commits
  
  def initialize(current_service, repo)
    @commits = current_service.commits(repo)
  end

  def comments
    commits.map { |object| object["commit"]["message"] }
  end

end
