node default {
  apt::source { 'puppetlabs':
    location   => 'http://apt.puppetlabs.com',
    repos      => 'main',
    key        => '4BD6EC30',
    key_server => 'pgp.mit.edu',
    before     => Package['puppetmaster'],
  }

  class { 'apt':
    always_apt_update    => true,
  }

  package {"puppetmaster": 
    before => Service["puppetmaster"],
  }

  service { "puppetmaster": 
    ensure => running,
  }
  
  exec { 'apt-get update':
    path  => '/usr/bin/',
    stage => first,
  }
  class {'dashboard':
     dashboard_ensure   => 'present',
     dashboard_user     => 'puppet-dbuser',
     dashboard_group    => 'puppet-dbgroup',
     dashboard_password => 'changeme',
     dashboard_db       => 'dashboard_prod',
     dashboard_charset  => 'utf8',
     dashboard_site     => $fqdn,
     dashboard_port     => '8080',
     mysql_root_pw      => 'changemetoo',
     passenger          => true,
     stage              => last,
  }

}
