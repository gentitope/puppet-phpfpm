# Controls PHP related services
class phpfpm::service(
) inherits ::phpfpm::params {

  $services.each |$service, $service_configuration|{
    Service{ $service:
      ensure  => $service_configuration['ensure'],
      enable  => $service_configuration['enable'],
      require => $service_configuration['require'],
    }
  }

}
