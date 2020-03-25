require_relative 'lib/wkhtmltox-binary/version'

Gem::Specification.new do |spec|
  spec.name          = 'wkhtmltox-binary'
  spec.version       = Wkhtmltox::Binary::VERSION
  spec.authors       = ['Jonathan PHILIPPE']
  spec.email         = ['jonathan@hoggo.com']

  spec.summary       = %q{Provides binaries for WKHTMLTOX project in an easily accessible package.}
  spec.homepage      = 'https://github.com/Infinitly/wkhtmltox-binary'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Infinitly/wkhtmltox-binary'
  spec.metadata['changelog_uri'] = 'https://github.com/Infinitly/wkhtmltox-binary/releases'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{(^(test|spec|features|.docker)/|^(.gitattributes|.gitignore)$)}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'minitest', '~> 5.14'
end
