require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.color     = true
  config.platform  = 'ubuntu'
  config.version   = '14.04'
  config.log_level = :error
  config.raise_errors_for_deprecations!
end

ChefSpec.define_matcher :runit_service

at_exit { ChefSpec::Coverage.report! }
