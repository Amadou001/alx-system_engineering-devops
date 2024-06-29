# Ensure SSH client configuration file exists
file { '/home/ubuntu/.ssh/config':  # Adjust path as necessary
  ensure  => file,
  mode    => '0600',  # Set permissions to 600
  owner   => 'ubuntu',  # Replace with appropriate user
  group   => 'ubuntu',  # Replace with appropriate group
  content => "
    # Global options (applies to all hosts unless overridden)
    Host *
        ServerAliveInterval 60
        ForwardX11 no
    
    # Configuration for specific host
        HostName 54.144.139.236  # Replace with your server's IP address or hostname
        User ubuntu               # Replace with your remote username
        IdentityFile ~/.ssh/school
        PasswordAuthentication no
  ",
}
