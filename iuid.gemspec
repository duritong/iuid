# frozen_string_literal: true

require_relative 'lib/iuid/version'

Gem::Specification.new do |spec|
  spec.name          = 'iuid'
  spec.version       = Iuid::VERSION::STRING
  spec.authors       = ['mh']
  spec.email         = ['mh+iuid@immerda.ch']

  spec.summary       = 'Iuid a simple uid generator and storage'
  spec.description   = 'Iuid generates and keeps uids stored. It generates the next unique uid based on a category range'
  spec.homepage      = 'https://github.com/duritong/iuid'
  spec.license       = 'GPL-3.0-or-later'
  spec.required_ruby_version = '>= 3.1.0'

  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['bug_tracker_uri'] = "#{spec.homepage}/issues"
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/master/CHANGELOG.md"
  spec.files         = Dir.glob('{bin,lib}/**/*').reject { |f| File.directory?(f) } + %w[LICENSE.txt README.md CHANGELOG.md]
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{\Abin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'moneta', '~> 1.6'
  spec.add_dependency 'pstore', '~> 0.2'

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.13'
  spec.add_development_dependency 'rspec-pending_for', '~> 0.1'
  spec.add_development_dependency 'rdoc', '~> 7.0'
end
