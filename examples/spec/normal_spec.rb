require_relative "spec_helper"

describe "a test" do
  30.times do |n|
    it "tests #{n}" do
      sleep(rand(1..2)/10.0)
      expect(1 + 2).to eq 3
    end
  end
end
