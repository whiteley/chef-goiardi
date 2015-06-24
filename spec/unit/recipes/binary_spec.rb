require "spec_helper"

describe "goiardi::binary" do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it "installs goiardi" do
    expect(chef_run).to create_remote_file("/usr/bin/goiardi")
  end
end
