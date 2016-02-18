class Following
  def initialize(current_service)
    @following = current_service.following
  end

  def names
    @following.map { |object| object["login"] }
  end
end
