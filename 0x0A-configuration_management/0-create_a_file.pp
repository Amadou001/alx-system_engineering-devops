# Define file resource to create /tmp/school with specific owner, group, permissions and content

file { '/tmp/school':           # file's path
ensure  => 'file',               # Ensure it's a regular file
content => 'I love Puppet',     # Content of the file
owner   => 'www-data',            # set owner to www-data
group   => 'www-data',            # set group to www-data
mode    => '0744',                 # Set the permissions (rwxr--r--)
}
