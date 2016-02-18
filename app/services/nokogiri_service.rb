require 'nokogiri'
require 'open-uri'

class NokogiriService
  attr_reader :doc
  def initialize(nickname)
    @doc = Nokogiri::HTML(open("https://github.com/#{nickname}"))
  end
end
