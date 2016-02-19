class WelcomeController < ApplicationController
  def index
    if current_user
      @info = Welcome.new(current_service, current_user)
    else
      @gitstats = Gitstat.all.sort_by{|record| record.current_streak.to_i}.reverse
    end
  end
end
