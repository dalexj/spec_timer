require_relative "spec_helper"

describe SpecTimer::Timer do
  let(:rspec_example)  { FakeRspecExample.new("./spec/fake_spec.rb:4", "FakeSpec#method works as expected") }
  let(:rspec_example2) { FakeRspecExample.new("./spec/fake_spec.rb:7", "FakeSpec#other_method works as expected") }

  def time_n_seconds(n, example=rspec_example)
    now = Time.new(2015, 9, 18, 12, 0, 0)
    later = Time.new(2015, 9, 18, 12, 0, n)
    Timecop.freeze(now)
    SpecTimer::Timer.start
    Timecop.freeze(later)
    SpecTimer::Timer.finish(example)
  end

  before do
    SpecTimer::Timer.reset
  end

  it "records time between start and finish" do
    time_n_seconds(4)
    expect(SpecTimer::Timer.time_taken).to eq 4
  end

  it "records the tests and times" do
    time_n_seconds(2, rspec_example)
    expect(SpecTimer::Timer.recorded.length).to eq 1

    time_n_seconds(5, rspec_example2)

    tests = SpecTimer::Timer.recorded
    expect(tests.length).to eq 2

    expect(tests.first[:name]).to eq rspec_example.full_description
    expect(tests.first[:file]).to eq rspec_example.location

    expect(tests.last[:name]).to eq rspec_example2.full_description
    expect(tests.last[:file]).to eq rspec_example2.location
  end

  it "long_tests only show the tests that are too long" do
    4.times do
      time_n_seconds(0.5, rspec_example)
    end

    6.times do
      time_n_seconds(rand(3..7), rspec_example)
    end

    expect(SpecTimer::Timer.recorded.length).to eq 10
    expect(SpecTimer::Timer.long_tests.length).to eq 6
  end
end
