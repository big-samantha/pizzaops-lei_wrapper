class lei_wrapper::role::ca_master {
  include lei_wrapper::profile::common
  
  #Shared amongst CA and non-CA masters.
  include lei_wrapper::profile::master
  include puppet_enterprise::profile::mcollective::peadmin
  include puppet_enterprise::profile::master::mcollective

  #CA masters only (at least by default - in theory a compile master could be an amq broker)
  include puppet_enterprise::profile::amq::broker
  include puppet_enterprise::profile::certificate_authority
}
