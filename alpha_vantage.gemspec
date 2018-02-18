
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "alpha_vantage/version"

Gem::Specification.new do |spec|
  spec.name          = "alpha_vantage"
  spec.version       = AlphaVantage::VERSION
  spec.authors       = ["Michael Wallbaum"]
  spec.email         = ["mwallba@mwallba.io"]

  spec.summary       = %q{A ruby client to access the Alpha Vantage API}
  spec.description   = %q{This gem allows you to retrieve Stock Market Time Series Date, Foreign Exchange Data and Digital/Crypto Date via the Alpha Vantage API}
  spec.homepage      = "https://github.com/mwallba/alpha_vantage/"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.7"
  spec.add_development_dependency 'webmock'
end
