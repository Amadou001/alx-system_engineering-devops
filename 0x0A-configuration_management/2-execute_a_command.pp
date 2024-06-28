# Define exec resource to kill the process named 'killmenow'
exec { 'kill_process':
  command => '/usr/bin/pkill -f "killmenow"',  # Full path to pkill command
  onlyif  => '/usr/bin/pgrep -f "killmenow"',  # Full path to pgrep command
  path    => ['/usr/bin', '/bin'],             # Define necessary paths
}
