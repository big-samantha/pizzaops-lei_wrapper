class lei_wrapper::role::master {
  include lei_wrapper::role::common
  include puppet_enterprise::profile::master
  include puppet_enterprise::profile::mcollective::peadmin
  include puppet_enterprise::profile::master::mcollective
}
