# pizzaops-lei_wrapper

This module is meant to be used as a wrapper around `puppetlabs-puppet_enterprise`, and (mostly) replicates the default configuration that you'll get with the console.

It disables the console node classifier, and assumes you will be using `hiera_include()`, `site.pp`, or another custom classification method.

**Notable differences:**
 - `puppet_enterprise::profile::mcollective::peadmin` is included only on the CA, not all masters. You may add it to any node you wish.
 - `puppetlabs-pe_repo` and its subclasses are not included at all, because I'd need to do platform detection. 


## Usage

Install the module via the method of your choice (puppet module install, r10k, git clone, etc),

`puppet apply examples/bootstrap.pp` on the CA master will disable the NC so that you can use this module. This must be done BEFORE using the classes in this module, otherwise  you'll end up with duplicate resource declarations between the module and what's built into the console's classifier.

**Check out `examples/site.pp` for example classification.**

Through the classification method of your choice (typically `hiera_include()` for LEI users), classify your nodes with the following:

 - CA Master: `lei_wrapper::role::ca_master`
 - PuppetDB: `lei_wrapper::role::puppetdb`
 - Console: `lei_wrapper::role::console`
 - Compile Master: `lei_wrapper::role::master`
 - ActiveMQ Hub: `lei_wrapper::role::amq_hub` 
 - ActiveMQ Spoke: `lei_wrapper::role::amq_spoke`
 - Agent Nodes: `lei_wrapper::role::agent`

Various data will need to be supplied to the `puppet_enterprise` class. You can do this by either declaring `puppet_enterprise` somewhere with parameters, or by supplying the data via hiera.

### Minimum `puppet_enterprise` Params

At a minimum, you will want to supply the following parameters to the `puppet_enterprise`:

 * `mcollective_middlware_hosts` - list of ActiveMQ spokes to be used for mcollective. The mcollective "server" that runs on all agents will try each one in order. You can supply different data to different nodes (e.g. if you have geo-distributed spokes).
 * `database_host` - DNS-addressable name of your PostgreSQL server, which if you are using the built in pe-postgresql, will be the PuppetDB node.
 * `puppetdb_host` - DNS-addressable name of your PuppetDB server.
 * `certificate_authority_host` - DNS-addressable name of your CA Master.
 * `console_host` - DNS-addressable name of your Console server.


### Optional but Very Important™ `puppet_enterprise` Params
 * `database_ssl` - This defaults to true - if you are using an external postgresql server not deployed for you by the PE installer, you MUST set this to false until you have [configured PE to use SSL](https://docs.puppetlabs.com/pe/3.7/install_ssl_postgresql.html) with this database.

## Additional Usage:
 - By default the console's ENC will be disabled for all masters, but you can re-enable it on a per-master basis by supplying the `disable_console_enc` value via hiera, in scope for one or all masters. If set to `false`, the console ENC will be enabled.
 - If the `disable_console_enc` param is set to `true` (default), you may optionally specify a custom value for the `node_terminus` setting in puppet.conf by setting the `node_terminus` value in hiera.  Otherwise the `node_terminus` value will be set to `plain`.
