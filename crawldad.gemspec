require_relative 'lib/crawldad/version'

Gem::Specification.new do |spec|
  spec.name          = "crawldad"
  spec.version       = Crawldad::VERSION
  spec.authors       = ["mnyrop"]
  spec.email         = ["marii@nyu.edu"]

  spec.summary       = "site migration helpers for crawling & diffing links"
  spec.homepage      = "https://github.com/mnyrop/crawldad"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mnyrop/crawldad"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'anemone'
  spec.add_runtime_dependency 'colorize'
  spec.add_runtime_dependency 'diffy'
  spec.add_runtime_dependency 'rake', '~> 13.0'
end
