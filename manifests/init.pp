# @summary Cofigure hostapd Raspberry PI specifically, but should work with RHEL / CentOS
#
# Installs hostapd and configures /etc/hostapd/hostapd.conf
# Initially, this was done for turning a Raspberry PI into a Wireless Access Point
#
# @example
#   include hostapd
class hostapd (
  String $ssid,
  String $wpa_passphrase,
  String $channel, # can potentially also be 'acs_survey' along with all the various numbers
  Enum['a','b','g','ad']  $hw_mode = 'a',
  String $country_code = 'AU',
  String $bridge = 'br0',
  String $driver = 'nl80211',
  String $interface = $hostapd::params::interface,
  String $config_file = $hostapd::params::config_file,
) inherits ::hostapd::params {

  # lets install some s/w first
  $hostap_pkgs = [
    'hostapd',
    'hostap-utils',
    'bridge-utils',
  ]
  ensure_packages($hostap_pkgs, { 'ensure' => 'installed',})

  # now lets configure the service
  file { $config_file :
    ensure  => 'file',
    content => epp('hostapd/hostapd.conf.epp'),
    mode    => '0640',
    notify  => Service['hostapd'],
  }

  # now lets make sure the service is running:
  service { 'hostapd':
    ensure => 'running',
    enable => true,
  }

}
