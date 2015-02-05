require 'spec_helper'

describe 'goiardi::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'installs goiardi' do
    expect(chef_run).to create_remote_file('/usr/bin/goiardi')
  end

  it 'configures goiardi' do
    chef_run.node.set[:goiardi][:confdir] = '/srv/goiardi'
    chef_run.converge(described_recipe)
    
    expect(chef_run).to create_directory('/srv/goiardi')
    expect(chef_run).to render_file('/srv/goiardi/goiardi.conf')
  end
end
