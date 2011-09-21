# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "arduino"
  s.version     = "0.4"
  s.date 				= %q{2011-01-01}
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Akash Manohar"]
  s.email       = ["akash@akash.im"]
  s.homepage    = "http://akash.im/arduino-ruby"
  s.summary     = %q{Arduino Prototyping API for Ruby}
  s.description = %q{A ruby library to talk to Arduino without having to burn programs repeatedly to the board}
	s.post_install_message = %q{
==============================================
Thank you for installing the arduino gem
----------------------------------------------
	
Load the arduino.pde program from http://ln.akash.im/arduino.pde to your board before using this library
	
Source: https://github.com/HashNuke/arduino/

--
@HashNuke
(http://akash.im)
==============================================
	}
  s.rubyforge_project = "arduino"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_runtime_dependency(%q<serialport>, [">= 1.0.4"])
end
