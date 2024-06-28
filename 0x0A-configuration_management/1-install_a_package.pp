# Ensure pip3 is installed
package { 'python3-pip':
  ensure => installed,
}

# Install Flask version 2.1.0
exec { 'install_flask':
  command => '/usr/bin/pip3 install flask==2.1.0', # Command to install Flask
  path    => ['/usr/bin', '/usr/sbin'],
  unless  => '/usr/bin/pip3 show flask | grep -q "Version: 2.1.0"', # Prevent reinstallation if version 2.1.0 is already installed
  require => Package['python3-pip'], # Ensure this runs after pip3 is installed
}
