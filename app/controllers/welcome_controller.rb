class WelcomeController < ApplicationController
  def index
    if current_user
      @starred_repos = Repo.new(current_service)
      @followers     = Follower.new(current_service)
      @following     = Following.new(current_service)
      @doc           = Summary.new(current_user)
      @organizations = Organization.new(current_service)
    end
  end
end
