require "spec_helper"

describe "goiardi::user" do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it "creates the goiardi group and user" do
    expect(chef_run).to create_group("goiardi")
    expect(chef_run).to create_user("goiardi")
  end
end
