require_relative "lib/spec_timer/version"

Gem::Specification.new do |s|
  s.name        = "spec_timer"
  s.version     = SpecTimer::VERSION
  s.licenses    = ["MIT"]
  s.summary     = "Times your tests"
  s.description = "SpecTimer is a testing hook that reports specs which took too long to run"
  s.author      = "dalexj"
  s.email       = "96dalex@gmail.com"
  s.files       = ["lib/spec_timer.rb"] + Dir["lib/spec_timer/*"]
  s.homepage    = "https://github.com/dalexj/spec_timer"
end
