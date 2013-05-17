define php::pear::install ($package = $title, $creates) {
  include 'php::pear'

  exec { "php::pear::install_${title}":
    command => "pear install ${package}",
    creates => $creates,
    path    => '/usr/bin:/usr/sbin',
    require => Class['php::pear'],
  }
}

