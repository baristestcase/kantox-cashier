# frozen_string_literal: true

require_relative "lib/kantox/cashier/version"

Gem::Specification.new do |spec|
  spec.name = "kantox-cashier"
  spec.version = Kantox::Cashier::VERSION
  spec.authors = ["Baris"]
  spec.email = ["brscimen@gmail.com"]

  spec.summary = "Kantox cashier challenge"
  spec.description = "cashier function that adds products to a cart and displays the total price"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
