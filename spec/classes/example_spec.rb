require 'spec_helper'

describe 'solo' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "solo class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('solo::params') }
        it { should contain_class('solo::install').that_comes_before('solo::config') }
        it { should contain_class('solo::config') }
        it { should contain_class('solo::service').that_subscribes_to('solo::config') }

        it { should contain_service('solo') }
        it { should contain_package('solo').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'solo class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('solo') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
