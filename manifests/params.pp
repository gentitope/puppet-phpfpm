# This class is responsible of retrieving the PHP-FPM parameters from Hiera
class phpfpm::params
  (

    Optional[
      Hash[
        String,
        String
      ]
    ] $extra_dependencies,

    Optional[
      Struct[{
        max_size_post   => Optional[String],
        max_size_upload => Optional[String]
        }]
    ] $limits
){

  $mandatory_dependencies = { 
    php5       => 'apt',
    php5-curl  => 'apt',
    php5-fpm   => 'apt',
    php5-mysql => 'apt'
  } 

}
