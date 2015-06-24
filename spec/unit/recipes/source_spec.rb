require "spec_helper"

describe "goiardi::source" do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  before do
    go_bin_go = "/usr/local/go/bin/go"
    stub_command("#{go_bin_go} version | grep \"go1.4 \"").and_return(true)
  end

  it "installs goiardi" do
    expect(chef_run).to install_golang_package("goiardi")
  end

  it "symlinks goiardi" do
    link = chef_run.link("/usr/bin/goiardi")
    expect(link).to link_to("/opt/go/bin/goiardi")
  end
end
