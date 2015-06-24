# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'chef-goiardi-berkshelf'
  config.vm.box = 'chef/ubuntu-14.04'
  config.vm.network :private_network, type: 'dhcp'

  if Vagrant.has_plugin?('vagrant-omnibus')
    config.omnibus.chef_version = 'latest'
  end

  config.berkshelf.enabled = true

  config.vm.provision :shell, inline: 'sudo apt-get update'
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      goiardi: {
        use_mysql: false,
	use_ssl: true,
	ssl_cert: "-----BEGIN CERTIFICATE-----\nMIIDYjCCAkoCCQC1AnuO21dT7TANBgkqhkiG9w0BAQUFADBzMQswCQYDVQQGEwJV\nUzETMBEGA1UECBMKV2FzaGluZ3RvbjEPMA0GA1UEBxMGVGFjb21hMRAwDgYDVQQK\nEwdHb2lhcmRpMQ0wCwYDVQQLEwR0ZWNoMR0wGwYDVQQDExRzZXJ2ZXIuZ29pYXJk\naS5sb2NhbDAeFw0xNTA2MDEwMzEyNTlaFw0xNjA1MzEwMzEyNTlaMHMxCzAJBgNV\nBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMQ8wDQYDVQQHEwZUYWNvbWExEDAO\nBgNVBAoTB0dvaWFyZGkxDTALBgNVBAsTBHRlY2gxHTAbBgNVBAMTFHNlcnZlci5n\nb2lhcmRpLmxvY2FsMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyJcf\nPxW/oLbbrbYan48bqKYukvLdGZAklq7+urVpPoP5Q8slzr5ZJGXTaRoKIKvgH/3F\nETJHD37mY8c8sQHzGtntB+4PISk4OoaPdIxB0Q7BJgdcssTCaBkoPtdOD/oTcGbM\nvRZMApMt9UbKiBJi6XVtVeWFNPASCOJugpYtfhXRIFthkWY8CcGbJXe2BQ040Wu+\nhYXXdc3iLXomtXrX7VoCKDl3+EcJvc8F5XbKTvGfoOZl6HrR4tU7+pcjoknDFG6z\nc5oJkC7w76jUQAgOOyxDsSdQu2hErZInJRUZi+o9/96Wxcqo1I/cziDfQyn6y579\nL/qOskgVETTGqCnMOwIDAQABMA0GCSqGSIb3DQEBBQUAA4IBAQCPIuYVne7QVzEo\nE0HalL0U8qCxZvKeeFs63jm+B0D/iljTQ/UtP/7Ph1/m2gp54Lm0qEqGBt5m00NM\nS6xutTK3aKz/QXHbpNZGJQTRyvo0G5tvv8wdUbd9+R5DmU22cu654RsQ5Pq9/eER\nA/EalG9hAF6eBBkM9d8IPdwAkg4P6yBwI5Ms81ZNtvzWy48M5zYF7WKndO88Ay38\ny0g+zmR+qWmAJYPdSIYKkHAOkf2LC9vNzej06Dq5Lg5SunJ+yfq0m/yRihpWpRiI\nfX3z+AwWEVV7IG7EffO/kia1mSYp0B0Oq/D6NKJxN+NkOquG6WMzqecwK9HSalX1\n/Q/cpYrx\n-----END CERTIFICATE-----\n",
	ssl_key: "-----BEGIN RSA PRIVATE KEY-----\nMIIEpQIBAAKCAQEAyJcfPxW/oLbbrbYan48bqKYukvLdGZAklq7+urVpPoP5Q8sl\nzr5ZJGXTaRoKIKvgH/3FETJHD37mY8c8sQHzGtntB+4PISk4OoaPdIxB0Q7BJgdc\nssTCaBkoPtdOD/oTcGbMvRZMApMt9UbKiBJi6XVtVeWFNPASCOJugpYtfhXRIFth\nkWY8CcGbJXe2BQ040Wu+hYXXdc3iLXomtXrX7VoCKDl3+EcJvc8F5XbKTvGfoOZl\n6HrR4tU7+pcjoknDFG6zc5oJkC7w76jUQAgOOyxDsSdQu2hErZInJRUZi+o9/96W\nxcqo1I/cziDfQyn6y579L/qOskgVETTGqCnMOwIDAQABAoIBABbdEtSv9+2rqhJ8\nxUAWocJxXrGlOQpm4aTDQYmqj9puVIUjrKWKEMMTUCuUqj7bGGrNFB9Hqc3cWwpY\ndVR/smQHHvteaR8QgbY6DDPuoLnhgqaBBFHkF3yiEXJIPD+Z84lGTmPnHLbWa9Cf\nRwqHffq6RcIarTpBeuzEUnBUCc9rHX/9w/b65zwWaGK/aqpiZg3kzeSzllAB/jzM\nvvIHmXfThRO579zar535nXBIprcT5G7VPYaMVfZCLb+j4/AQaKtius+91l7oHjK6\n1VH6iaU/RCSAxw+1XntMhQ6iYtdPhHlDhZBWSct+4xIEdLmxQRQRLOnxYNWuWKZt\nL7FetEECgYEA6tnynidYBwgqDIxQ9CtGH6EM1rVVKiD1zuJFc+zYvQQwUPln1zgS\nlcQ71KXQmaLDbIDii951Zn2GV30+4RL0UaqkrVXeU4maJvz+zblUbO/L3rJXX0ja\nXDyuyKu7dwJ6zc8BYvUaS2hNZ5wza7q9VBvNYo74ZXWa2a7+bckvr7ECgYEA2qdZ\n5DhD3f5zjo8Dnar/FMrVE8PNU6AXZhBdNvjvks7yR7lxNH9qPc4T7qFipKcn+rDr\n6y59WTZIyssDjtjvSsNkghchjxGrBtoFzMl3HxMBNlOz7MUhm2DQtrcOU5aVNi22\nGxOoi/gyVNARRc+jmC3s2YLXKMoav7Wh0KlLwasCgYEAkhpCoHczgTRoDGRinHQr\nbNPhS9WFhO76XNlRgdvvvi9T65wtKKv+i+OHoTQCwQGL9/16cq9TdA5VPCpzqswC\n6KdzSU5pQKkTGHw9/Df2uMq5lvJ1/pYxGj66Mab8uf317gGBCFIZKJ5bwUBgkP2c\neS3OqSjuiRgP3KrMJ/qISxECgYEAmAzkX+YYm9mEdlBRjWUJ+WWLgzEYKd0cKGec\nysuVnhu3M9VrObyZHt2d0sX7mNB85sH9bRBpLo6nVA6VLNMCpJT34ddACQOaUStv\n+RbodX17zFGsvyve0PQkb8sgdVQz8vcauf2TqbIxHfWK7WcVNpBJMoDgKodQzpv6\nKOZxvf0CgYEA1pokB05Q+2gWtB/uf/m0FXR2okQntTeBbX0eA5JxkQ7LjYYzaX8V\n9oPQFF1N3Sf8ATS2Qs+TtpLUSCLCeEq8T7z9pqS2dNsEkzOhqcYhLXn2iU8RtAbp\n8hN0+mIIRSXtTxsnhkeRCD06Zmv2w4ipEnBjQx9nUdv64GVXAb4IIxQ=\n-----END RSA PRIVATE KEY-----\n",
	hostname: "server.goiardi.local",
	webui: {
	  chef_server_url: "https://server.goiardi.local"
	}
      }
    }

    chef.run_list = [
      'recipe[goiardi::default]',
      'recipe[goiardi::webui]'
    ]
  end
end
