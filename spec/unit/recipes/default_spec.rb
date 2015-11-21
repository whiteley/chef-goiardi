require "json"
require "spec_helper"

describe "goiardi::default" do
  before do
    allow(Chef::EncryptedDataBagItem).to receive(:load).with(
      "certificates",
      "goiardi"
    ).and_return(cert_data_bag)
  end

  let(:cert_data_bag) do
    data_bag_path = "../../../fixtures/data_bags/certificates/goiardi.json"
    JSON.load(File.open(File.expand_path(data_bag_path, __FILE__)))
  end

  let(:ssl_cert)  { cert_data_bag["cert"] }
  let(:ssl_key)   { cert_data_bag["key"] }

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
    expect(chef_run).to create_file("/etc/goiardi/cert.pem").with(
      content: ssl_cert
    )
    expect(chef_run).to create_file("/etc/goiardi/key.pem").with(
      content: ssl_key
    )
  end

  it "prepares goiardi" do
    expect(chef_run).to create_directory("/var/run/goiardi")
    expect(chef_run).to create_directory("/var/lib/goiardi")
    expect(chef_run).to create_directory("/var/lib/goiardi/file_checksums")
  end

  context "when the SSL cert and key are given via attribute" do
    before do
      # Blank out the data bag to ensure we're pulling from attributes
      allow(Chef::EncryptedDataBagItem).to receive(:load).with(
        "certificates",
        "goiardi"
      ).and_return({})
    end

    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set["goiardi"]["use_ssl"] = true
        node.set["goiardi"]["ssl_cert"] = ssl_cert
        node.set["goiardi"]["ssl_key"] = ssl_key
      end.converge(described_recipe)
    end

    it "creates the SSL cert and key files" do
      expect(chef_run).to create_file("/etc/goiardi/cert.pem").with(
        content: ssl_cert
      )
      expect(chef_run).to create_file("/etc/goiardi/key.pem").with(
        content: ssl_key
      )
    end
  end
end
