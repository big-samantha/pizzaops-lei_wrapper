class lei_wrapper::role::common {
  include lei_wrapper::params
  include puppet_enterprise
  include puppet_enterprise::profile::mcollective::agent
}
