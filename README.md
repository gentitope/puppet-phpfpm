# lostinmalloc-phpfpm
#### Table of Contents
1. [Overview](#overview)
2. [Module Description](#module-description)
    * [What lostinmalloc-phpfpm does](#what-lostinmalloc-phpfpm-does)
    * [What lostinmalloc-phpfpm does not](#what-lostinmalloc-phpfpm-does-not)
3. [Setup](#setup)
    * [Requirements](#requirements)
4. [Usage](#usage)
5. [Reference](#reference)
6. [Limitations](#limitations)
7. [Contact](#contact)

## Overview
The `lostinmalloc-phpfpm` module manages both **PHP5** and **PHP-FPM**, the FastCGI Process Manager. It is distributed through the Apache License 2.0. Please do refer to the [LICENSE](https://github.com/jaschac/puppet-phpfpm/blob/master/LICENSE) for details.

## Module Description
The `lostinmalloc-phpfpm` module allows the client to install, customize and manage **PHP-FPM**, the FastCGI Process Manager for PHP. It takes care of installing all the required dependencies, which include `php5` itself, as well as other packages such as `php5-curl` and `php5-mysql`. If the client believes or requires extra dependencies to be installed, he can provide them to `lostinmalloc-phpfpm`, which will take care to install them.

At the moment, `lostinmalloc-phpfpm` does allow the client to customize only 2 settings of the daemon:

 - `post_max_size`
 - `upload_max_filesize`

### What lostinmalloc-phpfpm does
The `lostinmalloc-phpfpm` module is responsible of:

  - Installing PHP5.
  - Installing PHP5-FPM.
  - Customizing the PHP5-FPM configuration of the daemon.
  - Making sure the PHP5-FPM service is up and running.

### What lostinmalloc-phpfpm does not
The `lostinmalloc-phpfpm` module is **not**  responsible of:

  - Resolving conflicts between Apache and Nginx. The dependencies required by `php5-fpm`, indeed, do end up installing `apache2`, which, by default, starts and binds to port 80. Should the  client prefer Nginx, he must take care to remove/disable Apache.
  - Customizing the web server. In particular, while `lostinmalloc-phpfpm` does allow the client to change the maximum size of both the upload and a POST, it does not change anything in the settings of the web server used. This could end up in large files being uploaded to be rejected not because of PHP itself, but because of either Apache or Nginx.

## Setup
In order to install `lostinmalloc-phpfpm`, run the following command:
```bash
$ sudo puppet module install lostinmalloc-phpfpm
```
Once installed, creating an instance of `lostinmalloc-phpfpm` on a node is a simple as:
```bash
node 'puppet.lostinmalloc.com' {
  class { 'phpfpm': }
}
```
The module does expect all the data to be provided through 'Hiera'. See [Usage](#usage) for examples on how to configure it.

#### Requirements
In terms of **requirements** `lostinmalloc-phpfpm` demands:

  - `puppet >=4.0.0`

## Usage
As aforementioned, `lostinmalloc-phpfpm` expects all the data to be provided through `Hiera`.

In the example below, we are going to set the following:

  - We are installing an extra dependency, `cmatrix`, through APT.
  - We are setting the maximum size of a POST to 100MB.
  - We are setting the maximum size of an upload to 100MB.

```yaml
---
phpfpm::params::extra_dependencies:
  cmatrix: 'apt'
phpfpm::params::limits:
  max_size_post: '100M'
  max_size_upload: '100M'
```

## Reference
Attributes written *in italic*, are optional:

  -  *`extra_dependencies`*: a hash representing extra dependencies that the client wants to install. The information must be provided in the form `package_name : provider`. `lostinmalloc-phpfpm` takes care to merge both the mandatory and the extra dependencies into a unique hash and install any of the dependencies that are currently not present.
  -  *`limits`*: a hash representing the configuration of the `php5-fpm` daemon. At the moment, the following options can be customized:
    - `max_size_post`: it defines the maximum size, in megabytes, of a POST.
    - `max_size_upload`: it defines the maximum size, in megabytes, of an upload.

## Limitations
`lostinmalloc-phpfpm` has been developed and tested on the following setup(s):

  - Operating Systems:
    - Debian 7 Wheezy (3.2.68-1+deb7u3 x86_64)
    - Debian 8 Jessie (3.16.7-ckt11-1+deb8u3 x86_64)
  - Puppet
    - 4.2.1
  - Hiera
    - 3.0.1
  - Facter
    - 2.4.4
  - Ruby
    - 2.1.6p336

## Contact
You can contact me through:

  - The [GitHub page](https://github.com/jaschac/puppet-phpfpm) of `lostinmalloc-phpfpm`.
  - [Linkedin](https://es.linkedin.com/in/jaschacasadio).

Please feel free to report any bug and suggest new features/improvements.

