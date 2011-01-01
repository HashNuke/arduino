# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "arduino/version"

Gem::Specification.new do |s|
  s.name        = "arduino"
  s.version     = Arduino::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Akash Manohar"]
  s.email       = ["akash@akash.im"]
  s.homepage    = ""
  s.summary     = %q{Arduino Prototyping API for Ruby}
  s.description = %q{A ruby library to talk to Arduino without having to burn programs repeatedly to the board}

  s.rubyforge_project = "arduino"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
