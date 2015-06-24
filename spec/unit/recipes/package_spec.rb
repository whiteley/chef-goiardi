require "spec_helper"

describe "goiardi::package" do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it "configures goiardi repository" do
    expect(chef_run).to create_packagecloud_repo("ct/goiardi")
  end

  it "installs goiardi" do
    expect(chef_run).to install_package("goiardi")
  end
end
