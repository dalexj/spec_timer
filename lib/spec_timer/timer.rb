module SpecTimer::Timer
  def self.start
    @start_time = Time.now
  end

  def self.finish(example)
    @end_time = Time.now
    record(example)
  end

  def self.record(example)
    @recorded ||= []
    @recorded << { time: time_taken, file: example.location, name: example.full_description }
  end

  def self.long_tests
    recorded.select { |r| r[:time] > 1 }
  end

  def self.recorded
    @recorded
  end

  def self.time_taken
    @end_time - @start_time
  end

  def self.reset
    @recorded = []
  end
end
