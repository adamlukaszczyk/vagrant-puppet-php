class php ($php_version = 'present') {
  if ! defined(Package['php5']) {
    package { 'php5':
      ensure => $php_version,
    }
  }

  file { 'php.ini':
    ensure  => 'file',
    path    => '/etc/php5/apache2/php.ini',
    source  => 'puppet:///modules/php/development.php.ini',
    require => Package['php5'],
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}

