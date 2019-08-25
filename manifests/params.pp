# Params class :-)
#
class hostapd::params {

  # this is correct with both CentOS 7.6 and Raspbian / Buster 10
  $config_file = '/etc/hostapd/hostapd.conf'

  # wireless interface to use - default is wlan0 on RPI
  $interface = 'wlan0'

  # wpa=2 in config is our default (read epp for details)
  $wpa_value = 2

  # our packages; tweak for different flavours if required
  $hostap_pkgs = [
    'hostapd',
    'hostap-utils',
    'bridge-utils',
  ]

}
