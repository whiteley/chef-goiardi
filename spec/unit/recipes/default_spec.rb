require "spec_helper"

describe "goiardi::default" do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set["goiardi"]["use_ssl"] = true
    end.converge(described_recipe)
  end

  it "installs goiardi" do
    expect(chef_run).to include_recipe("goiardi::binary")
  end

  it "configures goiardi" do
    expect(chef_run).to create_directory("/etc/goiardi")
    expect(chef_run).to create_template("/etc/goiardi/goiardi.conf")
    expect(chef_run).to create_file("/etc/goiardi/cert.pem")
    expect(chef_run).to create_file("/etc/goiardi/key.pem")
  end

  it "prepares goiardi" do
    expect(chef_run).to create_directory("/var/run/goiardi")
    expect(chef_run).to create_directory("/var/run/goiardi/file_checksums")
  end
end
