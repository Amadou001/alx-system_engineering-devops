# Ensure SSH client configuration file exists
file { '/home/ubuntu/.ssh/config':  # Adjust path as necessary
  ensure  => file,
  content => "
    # Configuration for specific host
        HostName 54.144.139.236  # Replace with your server's IP address or hostname
        User ubuntu               # Replace with your remote username
        IdentityFile ~/.ssh/school
        PasswordAuthentication no
  ",
}
