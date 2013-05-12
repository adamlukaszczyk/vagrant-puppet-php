define php::pear::install ($package = $title, $creates) {
  exec { "php_pear_install_${title}":
    command => "pear install ${package}",
    creates => $creates,
    path    => '/usr/bin:/usr/sbin',
    require => Exec['php_pear_update_channels'],
  }
}

