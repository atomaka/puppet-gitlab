# Class:: gitlab::config
#
#
class gitlab::config inherits gitlab {
  File {
    owner     => $gitlab::params::git_user,
    group     => $gitlab::params::git_user,
  }

  # gitlab
  file { '/etc/nginx/conf.d/gitlab.conf':
    ensure  => file,
    content => template('gitlab/nginx-gitlab.conf.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
  }

  file { '/etc/init.d/gitlab':
    ensure  => file,
    content => template('gitlab/gitlab.init.erb'),
    owner   => root,
    group   => root,
    mode    => '0755',
  }

  # directories
  file { "${gitlab::params::git_home}/gitlab/tmp":
    ensure    => directory,
    mode      => '0755',
  }

  file { "${gitlab::params::git_home}/gitlab/tmp/pids":
    ensure    => directory,
    mode      => '0755',
  }

  file { "${gitlab::params::git_home}/gitlab/tmp/sockets":
    ensure    => directory,
    mode      => '0755',
  }

  file { "${gitlab::params::git_home}/gitlab/log":
    ensure    => directory,
    mode      => '0755',
  }

  file { "${gitlab::params::git_home}/gitlab/public":
    ensure    => directory,
    mode      => '0755',
  }

  file { "${gitlab::params::git_home}/gitlab/public/uploads":
    ensure    => directory,
    mode      => '0755',
  }
}
