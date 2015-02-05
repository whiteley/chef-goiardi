require 'spec_helper'

describe 'goiardi::runit_service' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'enables goiardi service' do
    expect(chef_run).to enable_service('goiardi')
  end

  it 'subscribes to goiardi configuration' do
    chef_run.node.set[:goiardi][:confdir] = '/srv/goiardi'
    service = chef_run.service('goiardi')
    expect(service).to subscribe_to('template[/srv/goiardi/goiardi.conf]')
  end
end
