class php::pear {
  exec { 'php_pear_upgrade':
    command => '/usr/bin/pear upgrade',
    require => Package['php-pear'],

    # @see http://blog.code4hire.com/2013/01/pear-packages-installation-under-vagrant-with-puppet/
    returns => [0, '', ' '],
  }

  exec { 'php_pear_autodiscover':
    command => '/usr/bin/pear config-set auto_discover 1',
    require => Exec['php_pear_upgrade'],
  }

  exec { 'php_pear_update_channels':
    command => '/usr/bin/pear update-channels',
    require => Exec['php_pear_autodiscover'],
  }
}

