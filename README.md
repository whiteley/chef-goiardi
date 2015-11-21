[![Stories in Ready](https://badge.waffle.io/whiteley/chef-goiardi.png?label=ready&title=Ready)](https://waffle.io/whiteley/chef-goiardi)
[![Build Status](http://img.shields.io/travis/whiteley/chef-goiardi.svg)](http://travis-ci.org/whiteley/chef-goiardi)
[![Cookbook Version](https://img.shields.io/cookbook/v/goiardi.svg)](https://supermarket.chef.io/cookbooks/goiardi)

# goiardi-cookbook

Installs and configures [Goiardi](http://goiardi.gl).

## Supported Platforms

* Debian 7
* Debian 8
* Ubuntu 12.04
* Ubuntu 14.04

## Attributes

### General
* `["goiardi"]["version"]` - Goiardi version to install
* `["goiardi"]["os"]` - Target OS (used to build download URL)
* `["goiardi"]["arch"]` - Target arch (used to build download URL)
* `["goiardi"]["install_method"]` - Install method (`binary`|`package`|`source`)
* `["goiardi"]["bin"]` - Goiardi binary download URL
* `["goiardi"]["repo"]` - Packagecloud repository
* `["goiardi"]["confdir"]` - Goiardi configuration directory
* `["goiardi"]["config"]` - Goiardi configuration file
* `["goiardi"]["rundir"]` - Goiardi run-time variable data directory
* `["goiardi"]["index_file"]` - File to save search index data to
* `["goiardi"]["data_file"]` - File to save data store data to
* `["goiardi"]["libdir"]` - Goiardi state directory
* `["goiardi"]["lfsdir"]` - Goiardi upload directory
* `["goiardi"]["ipaddress"]` - Address to listen on
* `["goiardi"]["port"]` - Port to listen on
* `["goiardi"]["hostname"]` - Hostname to use in served URLs
* `["goiardi"]["freeze_interval"]` - Interval in seconds to freeze in-memory
data structures to disk
* `["goiardi"]["obj_max_size"]` - Maximum object size in bytes for the file
store
* `["goiardi"]["json_req_max_size"]` - Maximum size for a JSON request from
the client
* `["goiardi"]["log_file"]` - Optional file to log to
* `["goiardi"]["syslog"]` - Optional syslog support
* `["goiardi"]["log_level"]` - Control log verbosity
* `["goiardi"]["use_auth"]` - Use authentication
* `["goiardi"]["user"]` - User Goiardi runs as
* `["goiardi"]["group"]` - User Goiardi runs as

### SSL
* `["goiardi"]["use_ssl"]` - Use SSL for connections
* `["goiardi"]["ssl_data_bag"]` - Data bag which contains the item to pull the SSL cert and key from
* `["goiardi"]["ssl_data_bag_item"]` - Data bag item to pull the SSL cert and key from. If `ssl_cert` and `ssl_key` are set, those will be used instead of the data bag contents
* `["goiardi"]["ssl_cert"]` - SSL certificate data, deprecated
* `["goiardi"]["ssl_key"]` - SSL key data, deprecated
* `["goiardi"]["ssl_cert_filename"]` - SSL certificate file
* `["goiardi"]["ssl_key_filename"]` - SSL key file
* `["goiardi"]["https_urls"]` - Use `https://` in URLs to server resources if
goiardi is not using SSL for its connections

### MySQL
* `["goiardi"]["use_mysql"]` - Use a MySQL database for data storage
* `["goiardi"]["mysql_username"]` - MySQL username
* `["goiardi"]["mysql_password"]` - MySQL password
* `["goiardi"]["mysql_protocol"]` - MySQL protocol (`tcp`|`unix`)
* `["goiardi"]["mysql_address"]` - MySQL address
* `["goiardi"]["mysql_port"]` - MySQL port
* `["goiardi"]["mysql_dbname"]` - MySQL database name

### PostgreSQL
* `["goiardi"]["use_postgresql"]` - Use a PostgreSQL database for data storage
* `["goiardi"]["postgresql_username"]` - PostgreSQL username
* `["goiardi"]["postgresql_password"]` - PostgreSQL password
* `["goiardi"]["postgresql_host"]` - PostgreSQL host
* `["goiardi"]["postgresql_port"]` - PostgreSQL port
* `["goiardi"]["postgresql_dbname"]` - PostgreSQL database name
* `["goiardi"]["postgresql_sslmode"]` - Use SSL for connections

## Usage

### goiardi::default

Include `goiardi` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[goiardi::default]"
  ]
}
```

## License and Authors

Author:: Matt Whiteley (<mwhiteley@fastly.com>)
