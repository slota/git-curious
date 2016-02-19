class Commit
  attr_reader :commits

  def initialize(current_service, repo)
    @raw_commits = current_service.commits(repo)
    if @raw_commits.kind_of?(Array)
      @commits = @raw_commits.map do |commit|
        Comment.new(commit["commit"]["message"], nil)
      end
    else
      @commits = [Comment.new(nil, "Not Found")]
    end
  end

  def comments
    commits.map { |commit| commit.message }
  end

end
