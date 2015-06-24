require "spec_helper"

describe "Goiardi configuration" do
  describe file("/etc/goiardi/goiardi.conf") do
    it { should be_a_file }
    its(:content) { should match('ipaddress = "0.0.0.0"') }
    its(:content) { should match("port = 4545") }
    its(:content) { should match('ssl-cert = "/etc/goiardi/cert.pem"') }
    its(:content) { should match('ssl-key = "/etc/goiardi/key.pem"') }
  end

  describe x509_certificate("/etc/goiardi/cert.pem") do
    it { should be_certificate }
  end

  describe x509_private_key("/etc/goiardi/key.pem") do
    it { should have_matching_certificate("/etc/goiardi/cert.pem") }
  end
end

describe "Goiardi installation" do
  describe port(4545) do
    it { should be_listening }
  end

  describe service("goiardi") do
    it { should be_running }
    # it { should be_monitored_by(:runit) }
  end
end
