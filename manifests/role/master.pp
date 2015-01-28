class lei_wrapper::role::master {
  include lei_wrapper::role::common
  include lei_wrapper::profile::master
  include puppet_enterprise::profile::mcollective::peadmin
  include puppet_enterprise::profile::master::mcollective
}
