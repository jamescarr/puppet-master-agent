node default {
  include puppet

}

class puppet {
  class {'aptness': }
  package {'puppet':
    ensure => latest,
  }
}
class aptness {
  apt::source { 'puppetlabs':
    location   => 'http://apt.puppetlabs.com',
    repos      => 'main',
    key        => '4BD6EC30',
    key_server => 'pgp.mit.edu',
  }

  class { 'apt':
    always_apt_update => true,
  }
}
