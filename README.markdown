# pizzaops-lei_wrapper

This module is meant to be used as a wrapper around `puppetlabs-puppet_enterprise`, and (mostly) replicates the default configuration that you'll get with the console.

It disables the console node classifier, and assumes you will be using `hiera_include()`, `site.pp`, or another custom classification method.

**Notable differences:**
 - `puppet_enterprise::profile::mcollective::peadmin` is included only on the CA, not all masters. You may add it to any node you wish.
 - `puppetlabs-pe_repo` and its subclasses are not included at all, because I'd need to do platform detection. 


