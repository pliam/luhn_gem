require 'rubygems'
require 'rake'
require 'rake/gempackagetask'
require 'rake/testtask'

require File.join(File.dirname(__FILE__), 'lib', 'luhn')

name              = "luhn"
summary           = 'Luhn checksum algorithm, credit card generation and validation'
author            = 'John Pliam'
email             = 'john.pliam@gmail.com'
version           = '0.4'

desc 'Default: run tests.'
task :default => ['test']

spec = Gem::Specification.new do |s|
  s.name              = name
  s.summary           = summary
  s.author            = author
  s.email             = email
  s.version           = version

  s.files = File.read('Manifest.txt').split(/\n/)
  s.has_rdoc = true
  s.test_files = Dir[*['test/**/test_*.rb']]
end

Rake::GemPackageTask.new spec do |pkg|
  pkg.need_tar = true
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = false
end
