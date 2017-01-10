require 'spec_helper'
require 'pp'

hiera = Hiera.new(:config => 'spec/fixtures/hiera/hiera.yaml')
file_contents = hiera.lookup('file_contents', nil, nil)

describe 'dim_test' do
  context 'supported operating systems' do
    ['RedHat'].each do |osfamily|
      describe "dim_test class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }
        it { pp catalogue.resources }
        it { pp file_contents }

        it { should contain_file('/tmp/hash.txt').with_content(/this is data-in-module file contents/) }
        it { should contain_file('/tmp/hash.txt').with_content(file_contents) }

      end
    end
  end
end
