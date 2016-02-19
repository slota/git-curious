class Comment
  attr_reader :commit_message, :error_message

  def initialize(commit_message, error_message)
    @commit_message = commit_message
    @error_message  = error_message
  end

  def message
    if error_message
      error_messages[error_message]
    else
      commit_message
    end
  end

  def error_messages
    {
      "Not Found" => "Somehow, someway you have no comments on this repo breh, go broncos!!",
      "Git Repository is empty." => "This git repo is empty let's go!!"
    }
  end


end
