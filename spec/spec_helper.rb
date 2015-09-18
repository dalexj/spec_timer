require_relative "../lib/spec_timer"
require "timecop"

class FakeRspecExample
  attr_reader :location, :full_description

  def initialize(location, full_description)
    @location = location
    @full_description = full_description
  end
end
