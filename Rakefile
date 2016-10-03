require "bundler/gem_tasks"

begin
  require "rspec/core/rake_task"
  require "rubocop/rake_task"
rescue LoadError
  abort "Run `bundle install` before using Rake!"
end

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new

task default: %i(spec rubocop)
