require 'spec_helper'

describe 'awscli', :type => 'class' do
  context 'supported OS' do
    [
     { :osfamily => 'darwin' },
     { :osfamily => 'debian' },
     { :osfamily => 'redhat', :operatingsystem => 'amazon', :operatingsystemrelease => '7' }
    ].each do |os_terms|
      describe "#{os_terms[:osfamily]} installation" do
        let(:facts) { os_terms }

        it { should contain_class("awscli::deps") }

        it do should contain_package('awscli').with(
          'ensure'   => 'present',
          'provider' => 'pip',
          'install_options' => nil,
        ) end
      end

      describe "proxy pip setup" do
        let(:facts) { os_terms }
        let(:params) { { :install_options => ['--proxy foo'] } }

        it do should contain_package('awscli').with(
          'ensure'   => 'present',
          'provider' => 'pip',
          'install_options' => ['--proxy foo'],
        ) end
      end
    end
  end
end
