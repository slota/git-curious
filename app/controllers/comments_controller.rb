class CommentsController < ApplicationController
  def index
    @comments = Comment.new(current_service, params[:format])
  end
end
