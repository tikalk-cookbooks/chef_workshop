name             'web'
maintainer       'Tikal Knowledge LTD'
maintainer_email 'c5191707@tikalk.com'
license          'Apache 2.0'
description      'Installs/Configures web'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'


depends 'nginx'
depends 'iptables' # opend nginx port(S)