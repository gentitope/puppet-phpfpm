# Install PHP dependencies
class phpfpm::install(
) inherits ::phpfpm::params
{

  $mandatory_dependencies = empty($::phpfpm::mandatory_dependencies) ? {
    false => $::phpfpm::mandatory_dependencies,
    true  => {},
  }
  
  $extra_dependencies = empty($::phpfpm::extra_dependencies) ? {
    false => $::phpfpm::extra_dependencies,
    true  => {},
  }

  $dependencies = merge($mandatory_dependencies, $extra_dependencies)
  
  if !empty($dependencies) {
    $dependencies.each |$dependency, $provider| {
      if !defined(Package[$dependency]) {
        Package{ $dependency:
          ensure   => present,
          provider => $provider,
          tag      => 'phpfpm'
        }
      }
    }
  }

}
