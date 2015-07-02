class lei_wrapper::profile::master {
  $disable_console_enc = hiera('disable_console_enc', true)
  $node_terminus = hiera('node_terminus', 'plain')

  if $disable_console_enc == true {
    class { 'puppet_enterprise::profile::master':
      classifier_host => false,
    } ->
    pe_ini_setting { 'disable_console_classifier':
      ensure  => present,
      path    => '/etc/puppetlabs/puppet/puppet.conf',
      section => 'master',
      setting => 'node_terminus',
      value   => $node_terminus,
      notify  => Service['pe-puppetserver']
    }
  }
  else {
    include puppet_enterprise::profile::master
  }

}
