# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
    spec.name          = "elevator"
    spec.version       = '1.0'
    spec.authors       = ["Ricardo Parro"]
    spec.email         = ["ricardo@gmail.com"]
    spec.summary       = %q{Basic elevator}
    spec.description   = %q{Model an elevator using TDD}
    spec.homepage      = ""
    spec.license       = "MIT"

    spec.files         = ['lib/elevator.rb']
    spec.executables   = ['bin/elvator']
    spec.test_files    = ['tests/test_elevator.rb']
    spec.require_paths = ["lib"]
end
