# == Class: awscli
#
# Install awscli
#
# === Parameters
#
#  [$version]
#    Provides ability to change the version of awscli being installed.
#    Default: 'present'
#    This variable is required.
#  [$manage_deps]
#    Whether to install Python dependencies or not.
#    Default: true
#
# === Examples
#
#  class { awscli: }
#
# === Authors
#
# Justin Downing <justin@downing.us>
#
# === Copyright
#
# Copyright 2014 Justin Downing
#
class awscli (
  $version = 'present',
  $manage_deps = true,
) {
  if $manage_deps {
    include awscli::deps
  }

  package { 'awscli':
    ensure   => $version,
    provider => 'pip',
    require  => Class['awscli::deps'],
  }
}
