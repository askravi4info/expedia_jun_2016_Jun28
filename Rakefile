require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

# Cucumber::Rake::Task.new(:features) do |t|
#   t.profile = 'default'
# end
#
# task :default => :features


namespace :features do
  Cucumber::Rake::Task.new(:smoke) do |t|
    t.profile = 'smoke'
  end
  Cucumber::Rake::Task.new(:slow) do |t|
    t.profile = 'slow'
  end
  task :ci => [:smoke, :slow]
end

task :default => :smoke
