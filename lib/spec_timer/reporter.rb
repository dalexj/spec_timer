class SpecTimer::Reporter
  def self.report
    long_tests = SpecTimer::Timer.long_tests
    puts SpecTimer::Color.text("\n\nUsing SpecTimer", :yellow)

    if long_tests.any?
      puts "Long Tests:"
      long_tests.each_with_index do |test, index|
        puts SpecTimer::Color.text("\n  #{index + 1}) #{test[:name]}", :yellow)
        puts SpecTimer::Color.text("    Took to long: #{test[:time]} seconds!", :red)
        puts SpecTimer::Color.text("    # #{test[:file]}", :cyan)
      end
      puts "\nSlow examples:"
      long_tests.each do |test|
        print SpecTimer::Color.text("rspec #{test[:file]} ", :red)
        puts SpecTimer::Color.text("# #{test[:name]}", :cyan)
      end
    else
      puts SpecTimer::Color.text("All tests are under the maximum allowed time!", :green)
    end
  end
end

class SpecTimer::Color
  COLOR_CONVERSION = {
    red:     1,
    green:   2,
    yellow:  3,
    blue:    4,
    magenta: 5,
    cyan:    6,
    white:   7
  }

  def self.text(string, color)
    "\e[#{COLOR_CONVERSION[color] + 30}m#{string}\e[0m"
  end

  def self.background(string, color)
    "\e[#{COLOR_CONVERSION[color] + 40}m#{string}\e[0m"
  end
end
