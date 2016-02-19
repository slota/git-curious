class GitstatsController < ApplicationController
  def new
    @gitstat = Gitstat.new
  end

  def create
    check_nickname_exists
    @new_gitstat = Gitstat.new(nickname: params[:gitstat][:nickname], current_streak: @summary.current_streak)
    git_save_or_error_out
  end

  def check_nickname_exists
    begin
      @summary = Summary.new(params[:gitstat][:nickname])
    rescue OpenURI::HTTPError
      redirect_to new_gitstat_path, notice: "Github nickname does not exist"
      return
    end
  end

  def git_save_or_error_out
    if @new_gitstat.save
      redirect_to root_path, notice: "#{params[:gitstat][:nickname]} nickname just added to the sweet list"
    else
      redirect_to new_gitstat_path, notice: "Github nickname error, you probably are already on the board"
    end
  end

end
