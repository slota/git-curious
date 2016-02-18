class Comment
  def initialize(current_service, repo)
    @comments = current_service.comments(repo)
  end
end
