ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new

Minitest::ExtensibleBacktraceFilter.default_filter.add_filter(
  /(activerecord|actionpack|actionview|activesupport|rack|railties|capybara)/
)

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
end
