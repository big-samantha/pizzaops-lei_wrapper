## Supply data to all classes via puppet_enterprise class.
class { 'puppet_enterprise':
  mcollective_middleware_hosts => ['amqspoke-1.puppetlabs.com','amqspoke-2.puppetlabs.com','amqspoke-3.puppetlabs.com'],
  database_host                => 'puppetdb.puppetlabs.com',
  puppetdb_host                => 'puppetdb.puppetlabs.com',
  certificate_authority_host   => 'camaster.puppetlabs.com',
  console_host                 => 'console.puppetlabs.com',
}

## Core PE Infrastructure
node 'camaster.puppetlabs.com' {
  include 'lei_wrapper::role::ca_master'
}

node 'puppetdb.puppetlabs.com' {
  include 'lei_wrapper::role::puppetdb'
}

node 'console.puppetlabs.com' {
  include 'lei_wrapper::role::console'
}

# Three Compile Masters
node 'compilemaster-1.puppetlabs.com' {
  include 'lei_wrapper::role::master'
}
node 'compilemaster-2.puppetlabs.com' {
  include 'lei_wrapper::role::master'
}
node 'compilemaster-3.puppetlabs.com' {
  include 'lei_wrapper::role::master'
}

# ActiveMQ Hub and 3 Spokes
node 'amqhub.puppetlabs.com' {
  include 'lei_wrapper::role::amq_hub'
}

node 'amqspoke-1.puppetlabs.com' {
  include 'lei_wrapper::role::amq_spoke'
}
node 'amqspoke-2.puppetlabs.com' {
  include 'lei_wrapper::role::amq_spoke'
}
node 'amqspoke-3.puppetlabs.com' {
  include 'lei_wrapper::role::amq_spoke'
}

## All agents get the agent role.
include 'lei_wrapper::role::agent'
