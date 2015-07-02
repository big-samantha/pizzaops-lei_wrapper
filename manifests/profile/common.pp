class lei_wrapper::profile::common {
  include lei_wrapper::params
  include puppet_enterprise
  include puppet_enterprise::profile::agent
  include puppet_enterprise::profile::mcollective::agent
}
