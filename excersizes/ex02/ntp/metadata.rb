name		 "ntp"
maintainer       "Tikal Knowledge"
maintainer_email "hagzag@tikalk.com"
license          "Apache 2.0"
description      "Installs/Configures ntp"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.1"

%w{ redhat ubuntu debian }.each do |os|
  supports os
end
