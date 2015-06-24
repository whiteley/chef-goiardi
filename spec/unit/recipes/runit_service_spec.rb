require "spec_helper"

describe "goiardi::runit_service" do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it "enables goiardi service" do
    expect(chef_run).to enable_runit_service("goiardi")
  end

  it "subscribes to goiardi configuration" do
    service = chef_run.runit_service("goiardi")
    expect(service).to subscribe_to("template[/etc/goiardi/goiardi.conf]")
  end
end
