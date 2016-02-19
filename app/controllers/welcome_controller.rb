class WelcomeController < ApplicationController
  def index
    if current_user
      @info = Welcome.new(current_service, current_user)
    end
  end
end
