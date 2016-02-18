class Follower
  def initialize(current_service)
    @followers = current_service.followers
  
  end

  def names
    @followers.map { |object| object["login"] }
  end
end
