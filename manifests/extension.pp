define php::extension ($extension = $title, $ensure = 'present', $require = undef) {
  $base_require = Package['php5']

  if $require {
    $full_require = [ $base_require, $require ]
  } else {
    $full_require = $base_require
  }

  package { $extension:
    ensure  => $ensure,
    require => $full_require,
  }
}

