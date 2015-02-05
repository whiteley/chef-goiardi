require 'serverspec'

set :backend, :exec


describe "Goiardi" do

  it "is listening on port 4545" do
    expect(port(4545)).to be_listening
  end

  it "has a running service of goiardi" do
    expect(service("goiardi")).to be_running
  end

end
