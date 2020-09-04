nomad-practice
========
My [Nomad] and [Consul Connect] practice using [simnalamburt/sample-redis-app].

![Screenshot]

```bash
# See https://www.nomadproject.io/docs/integrations/consul-connect
consul agent -dev
sudo nomad agent -dev-connect

# Install CNI plugins

# Check if container traffic through the bridge network is
# allowed to be routed via iptables
cat /proc/sys/net/bridge/bridge-nf-call-{arp,ip6,ip}tables
# 1, 1, 1 should be printed

nomad job run example.nomad
```

[Nomad]: https://www.nomadproject.io/
[Consul Connect]: https://www.consul.io/docs/connect
[Screenshot]: https://raw.githubusercontent.com/simnalamburt/i/master/sample-redis-app/screenshot.png
[simnalamburt/sample-redis-app]: https://github.com/simnalamburt/sample-redis-app
