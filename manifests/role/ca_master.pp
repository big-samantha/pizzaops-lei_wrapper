class lei_wrapper::ca_master {
  include lei_wrapper::master
  include puppet_enterprise::profile::amq::broker
  include puppet_enterprise::profile::mcollective::peadmin
  include puppet_enterprise::profile::certificate_authority
}
