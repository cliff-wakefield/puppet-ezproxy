# == Define ezproxy::stanza
#
# This define builds a stanza fragment to be used in the sites config file.
#
# === Parameters
#
# [*urls*]
#   Array of URLs for the stanza.
#
# [*hosts*]
#   Array of hosts for the stanza.
#
# [*domains*]
#   Array of domains for the stanza.
#
# [*domain_js*]
#   Array of domainjavascript entries for the stanza.
#
# [*host_js*]
#   Array of hostjavascript entries for the stanza.
#
# [*prepends*]
#   Array of stanza options to include at the beginning of the stanza.
#
# [*appends*]
#   Array of stanza options to include at the end of the stanza.
#
# [*order*]
#   Include order for the stanza.
#
define ezproxy::stanza (
  $urls      = [],
  $hosts     = [],
  $domains   = [],
  $domain_js = [],
  $host_js   = [],
  $prepends  = [],
  $appends   = [],
  $order     = '1',
  ) {
  concat::fragment { $name:
    ensure  => present,
    target  => 'ezproxy sites',
    content => template('ezproxy/stanza.erb'),
    order   => $order,
    notify  => Service[$::ezproxy::service_name]
  }
}