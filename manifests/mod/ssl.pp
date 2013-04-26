class apache::mod::ssl {
  apache::mod { 'ssl': }

  # create the ssl.conf based off the template
  file { "ssl.conf":
    ensure => $ensure,
    path => "${apache::params::vdir}/ssl.conf",
    content => template('apache/mod/ssl.conf.erb'),
    owner => root,
    group => root,
    mode => 0644,
    require => [
      Package['httpd'],
    ],
    notify  => Service['httpd'],
  }

  # create the ssl_cert_destdir directory
  file { "${apache::params::ssl_cert_destdir}",
    ensure => directory,
    owner => root,
    group => root,
    mode => 0755,
    require => Package['httpd'],
  }
}
