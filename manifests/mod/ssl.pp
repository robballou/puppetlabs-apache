class apache::mod::ssl {
  apache::mod { 'ssl': }

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
}
