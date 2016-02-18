class Event
  attr_reader :events

  def initialize(current_service)
    @events = current_service.events.take(5)
  end

  def story
    events.map do |object|
      "#{object["actor"]["login"]}, #{object["type"]}, #{object["repo"]["name"]}"
    end
  end


end
