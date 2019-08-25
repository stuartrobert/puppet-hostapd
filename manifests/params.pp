# Params class :-)
#
class hostapd::params {

  # this is correct with both CentOS 7.6 and Raspbian / Buster 10
  $config_file = '/etc/hostapd/hostapd.conf'

  # wireless interface to use - default is wlan0 on RPI
  $interface = 'wlan0'

}
