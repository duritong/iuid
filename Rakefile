# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'


require 'jeweler'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'iuid'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "iuid"
  gem.homepage = "http://www.immerda.ch"
  gem.license = "GPLv3"
  gem.summary = "Iuid a simple uid generator and storage"
  gem.description = "Iuid generates and keeps uids stored. It generates the next unique uid based on a category range"
  gem.email = "mh+iuid@immerda.ch"
  gem.authors = ["mh"]
  gem.version = Iuid::VERSION::STRING
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

gem 'rdoc'
require 'rdoc/task'
RDoc::Task.new do |rdoc|
  version = Iuid::VERSION::STRING
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "iuid #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
