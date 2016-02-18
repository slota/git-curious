class CommitsController < ApplicationController
  def index
    @commits = Commit.new(current_service, params[:format])
  end
end
