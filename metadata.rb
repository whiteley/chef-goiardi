name             "goiardi"
maintainer       "Matt Whiteley"
maintainer_email "mwhiteley@fastly.com"
license          "Apache 2.0"
description      "Installs/Configures goiardi"
long_description "Installs/Configures goiardi"
version          "0.3.9"

depends "golang", "~> 1.7.0"
depends "packagecloud", "~> 0.1.0"
depends "runit", "~> 1.7.4"

supports "ubuntu", ">= 12.04"
supports "debian"

source_url "https://github.com/whiteley/chef-#{name}"
issues_url "https://github.com/whiteley/chef-#{name}/issues"
