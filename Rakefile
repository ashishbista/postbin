# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc 'Runs Rubocop static code analyzer'
task :rubocop do
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
end

desc 'Runs rails_best_practices and informs about found issues'
task :rails_best_practices do
  require 'rails_best_practices'

  puts 'Running rails_best_practices'

  output_file = File.new('rails_best_practices.html', 'w')

  analyzer = RailsBestPractices::Analyzer.new(Rake.application.original_dir, {
    'format': 'html',
    'with-textmate': true,
    'output-file': output_file
  })
  analyzer.analyze
  analyzer.output

  fail 'found bad practices' if !analyzer.runner.errors.empty?
end

task :default => [:spec, :rails_best_practices, :rubocop]
