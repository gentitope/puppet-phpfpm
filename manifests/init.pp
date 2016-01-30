# Defines a PHP-FPM instance
class phpfpm(
) inherits ::phpfpm::params {
  contain ::phpfpm::install
  contain ::phpfpm::config
  contain ::phpfpm::service
}
