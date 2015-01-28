class lei_wrapper::console {
  include lei_wrapper::common
  include puppet_enterprise::license
  include pe_console_prune
  include puppet_enterprise::profile::console
  include puppet_enterprise::profile::mcollective::console
}
