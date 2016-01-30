# Controls PHP related services
class phpfpm::service(
) inherits ::phpfpm::params {

  $services.each |$service, $service_configuration|{
    Service{ $service:
      enable  => $service_configuration['enable'],
      ensure  => $service_configuration['ensure'],
      require => $service_configuration['require'],
    }
  }

}
