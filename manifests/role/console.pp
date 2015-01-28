class lei_wrapper::role::console {
  include lei_wrapper::role::common
  include puppet_enterprise::license
  include pe_console_prune
  include puppet_enterprise::profile::console
  include puppet_enterprise::profile::mcollective::console
}
