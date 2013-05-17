define php::pear::install ($package = $title, $creates, $dependencies = 'false') {
  include 'php::pear'

  if ($dependencies == 'true') {
    $deps = '--alldeps'
  } else {
    $deps = ''
  }

  exec { "php::pear::install_${title}":
    command => "pear install ${deps} ${package}",
    creates => $creates,
    path    => '/usr/bin:/usr/sbin',
    require => Class['php::pear'],
  }
}

