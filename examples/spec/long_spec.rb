require_relative "spec_helper"

describe "Another test" do
  it "passes" do
    sleep(0.5)
    expect(1 + 2).to eq 3
  end

  it "passes again" do
    sleep(0.5)
    expect(1 + 2).to eq 3
  end
end

describe "All my slow tests" do
  it "takes forever" do
    sleep(1.2)
  end

  it "takes a long time" do
    sleep(1.3)
  end

  it "takes a little bit" do
    sleep(0.5)
  end

  it "takes forever again" do
    sleep(1.4)
  end
end
