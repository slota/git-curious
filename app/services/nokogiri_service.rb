require 'nokogiri'
require 'open-uri'

class NokogiriService
  attr_reader :doc
  def initialize(current_user)
    @doc = Nokogiri::HTML(open("https://github.com/#{current_user.nickname}"))
  end
end
