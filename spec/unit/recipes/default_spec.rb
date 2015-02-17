require 'spec_helper'

describe 'goiardi::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'installs goiardi' do
    expect(chef_run).to create_remote_file('/usr/bin/goiardi')
  end

  it 'configures goiardi' do
    expect(chef_run).to create_directory('/etc/goiardi')
    expect(chef_run).to render_file('/etc/goiardi/goiardi.conf')
  end

  it 'prepares goiardi' do
    expect(chef_run).to create_directory('/var/run/goiardi')
    expect(chef_run).to create_directory('/var/run/goiardi/file_checksums')
  end
end
