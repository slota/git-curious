class Commit
  attr_reader :commits

  def initialize(current_service, repo)
    @commits = current_service.commits(repo)
  end

  def comments
    if commits == {"message"=>"Not Found",
                   "documentation_url"=>"https://developer.github.com/v3"}
      broncos_easter_egg = ["Somehow, someway you have no comments on this repo breh, go broncos!!"]
    elsif
      commits == {"message"=>"Git Repository is empty.",
                  "documentation_url"=>"https://developer.github.com/v3"}
      broncos_easter_egg = ["This git repo is empty let's go!!"]
    else
      commits.map { |object| object["commit"]["message"] }
    end
  end

end
