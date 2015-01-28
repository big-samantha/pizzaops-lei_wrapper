class lei_wrapper::master {
  include lei_wrapper::common
  include puppet_enterprise::profile::master
  include puppet_enterprise::profile::mcollective::peadmin
  include puppet_enterprise::profile::master::mcollective
}
