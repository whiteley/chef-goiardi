require "foodcritic"
require "rspec/core/rake_task"
require "rubocop/rake_task"

namespace :integration do
  desc "Run Test Kitchen with Vagrant"
  task :vagrant do
    Kitchen.logger = Kitchen.default_file_logger
    Kitchen::Config.new.instances.each do |instance|
      instance.test(:always)
    end
  end
end

namespace :style do
  desc "Run Ruby style checks"
  RuboCop::RakeTask.new(:ruby)

  desc "Run Chef style checks"
  FoodCritic::Rake::LintTask.new(:chef) do |t|
    t.options = {
      fail_tags: ["any"]
    }
  end
end

desc "Run all style checks"
task style: ["style:chef", "style:ruby"]

desc "Run ChefSpec examples"
RSpec::Core::RakeTask.new(:spec)

task default: ["style", "spec", "integration:vagrant"]
