require 'test_helper'
require 'rubygems'
require 'nokogiri'

class NokogiriServiceTest < ActiveSupport::TestCase
  test "#nokogiri" do
    VCR.use_cassette('noko_service') do
      user = "slotaj"
      giri_service_object = NokogiriService.new(user)
      refute giri_service_object.nil?
      assert_equal giri_service_object.name, "slotaj"
    end
  end
end
