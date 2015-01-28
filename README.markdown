# pizzaops-lei_wrapper

This module is meant to be used as a wrapper around `puppetlabs-puppet_enterprise`, and (mostly) replicates the default configuration that you'll get with the console.

It disables the console node classifier, and assumes you will be using `hiera_include()`, `site.pp`, or another custom classification method.

**Notable differences:**
 - `puppet_enterprise::profile::mcollective::peadmin` is included only on the CA, not all masters. You may add it to any node you wish.
 - `puppetlabs-pe_repo` and its subclasses are not included at all, because I'd need to do platform detection. 


## Usage

Through the classification method of your choice (typically `hiera_include()` for LEI users), classify your nodes with the following:

 - CA Master: `lei_wrapper::role::ca_master`
 - PuppetDB: `lei_wrapper::role::puppetdb`
 - Console: `lei_wrapper::role::console`
 - Compile Master: `lei_wrapper::role::master`
 - ActiveMQ Hub: `lei_wrapper::role::amq_hub` 
 - ActiveMQ Spoke: `lei_wrapper::role::amq_spoke`
 - Agent Nodes: `lei_wrapper::role::agent`

Additional Usage:
 - By default the console's ENC will be disabled for all masters, but you can re-enable it on a per-master basis by supplying the `disable_console_enc` value via hiera, in scope for one or all masters. If set to `false`, the console ENC will be enabled.
