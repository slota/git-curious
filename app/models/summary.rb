class Summary
  attr_reader :doc

  def initialize(current_user)
    @doc = NokogiriService.new(current_user)
  end

  def total_contributions
    @doc.doc.css(".contrib-number").text.split[0]
  end

  def longest_streak
    @doc.doc.css("div.contrib-column.table-column")[1].text.split[2]
  end

  def current_streak
    @doc.doc.css("div.contrib-column.table-column")[2].text.split[2]
  end
end
