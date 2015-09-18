RSpec.configure do |config|
  config.before(:each) do
    SpecTimer::Timer.start
  end

  config.after(:each) do |example|
    SpecTimer::Timer.finish(example)
  end

  config.after(:suite) do
    SpecTimer::Reporter.report
  end
end
