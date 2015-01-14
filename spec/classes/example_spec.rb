require 'spec_helper'

describe 'dim_test' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "dim_test class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('dim_test::params') }
        it { should contain_class('dim_test::install').that_comes_before('dim_test::config') }
        it { should contain_class('dim_test::config') }
        it { should contain_class('dim_test::service').that_subscribes_to('dim_test::config') }

        it { should contain_service('dim_test') }
        it { should contain_package('dim_test').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'dim_test class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('dim_test') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
