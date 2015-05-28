name             'goiardi'
maintainer       'Matt Whiteley'
maintainer_email 'mwhiteley@fastly.com'
license          'Apache 2.0'
description      'Installs/Configures goiardi'
long_description 'Installs/Configures goiardi'
version          '0.3.0'

depends          'runit'
depends		 'packagecloud', '~> 0.0.17'
depends		 'golang', '~> 1.5.1'
depends		 'nginx', '~> 2.7.6'
depends		 'rbenv', '~> 1.7.1'


supports         'ubuntu', '>= 12.04'
supports         'debian'
