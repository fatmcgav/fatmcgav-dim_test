require 'puppetlabs_spec_helper/module_spec_helper'
require 'hiera'
require 'rspec-puppet'

def fixture_path
    File.join(File.dirname(__FILE__), 'fixtures')
end

# Add fixture lib dirs to LOAD_PATH. Work-around for PUP-3336
#
if Puppet.version < "4.0.0"
  Dir["#{fixture_path}/modules/*/lib"].entries.each do |lib_dir|
    $LOAD_PATH << lib_dir
  end
end

RSpec.configure do |c|
  c.before(:each) do
    Puppet::Util::Log.level = :debug
    Puppet::Util::Log.newdestination(:console)
  end

  c.color = true
  c.formatter = :documentation

  c.hiera_config = 'spec/fixtures/hiera/hiera.yaml'
end
