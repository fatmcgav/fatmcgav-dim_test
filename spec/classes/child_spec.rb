require 'spec_helper'
require 'pp'

# hiera = Hiera.new(:config => 'spec/fixtures/hiera/hiera.yaml')
# file_name = hiera.lookup('dim_test::filename', nil, nil)
# file_contents = hiera.lookup('file_contents', nil, nil)

describe 'dim_test::child' do
  context 'with defaults' do

    it { should compile.with_all_deps }
    
    it { pp catalogue.resources }

    it { should contain_class('dim_test_child') }
    it { should contain_notify('hiera value') }

  end
end
