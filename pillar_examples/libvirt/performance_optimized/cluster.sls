cluster:
  name: 'hana_cluster'
  init: 'hana01'
  interface: 'eth1'
  unicast: True
  watchdog:
    module: softdog
    device: /dev/watchdog
  sbd:
    device: '/dev/vdc'
  ntp: pool.ntp.org
  sshkeys:
    overwrite: true
    password: linux
  resource_agents:
    - SAPHanaSR
  ha_exporter: false
  configure:
    method: 'update'
    template:
      source: /usr/share/salt-formulas/states/hana/templates/scale_up_resources.j2
      parameters:
        sid: prd
        instance: "00"
        virtual_ip: 192.168.107.50
        virtual_ip_mask: 24
        prefer_takeover: true
        auto_register: false
