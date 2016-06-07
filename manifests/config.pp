# Configure PHP specific parameters
class phpfpm::config(){

  file { '/etc/php5/fpm/php.ini':
    ensure  => file,
    content => epp(
      'phpfpm/php.ini.epp',
      {'limits' => $::phpfpm::limits}
      )
  }

}
