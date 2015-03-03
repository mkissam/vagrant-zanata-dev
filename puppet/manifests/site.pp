exec { "apt-update":
  command => "/usr/bin/apt-get update",
  onlyif => "/bin/sh -c '[ ! -f /var/cache/apt/pkgcache.bin ] || /usr/bin/find /etc/apt/* -cnewer /var/cache/apt/pkgcache.bin | /bin/grep . > /dev/null'",
}

Exec["apt-update"] -> Package <| |>

node zanata-dev {
  class { 'zanata::wildfly':
  }
  class { 'zanata':
  }
}