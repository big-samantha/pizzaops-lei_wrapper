require 'spec_helper'

describe 'lei_wrapper' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "lei_wrapper class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('lei_wrapper::params') }
        it { should contain_class('lei_wrapper::install').that_comes_before('lei_wrapper::config') }
        it { should contain_class('lei_wrapper::config') }
        it { should contain_class('lei_wrapper::service').that_subscribes_to('lei_wrapper::config') }

        it { should contain_service('lei_wrapper') }
        it { should contain_package('lei_wrapper').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'lei_wrapper class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('lei_wrapper') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
