# Docker Statsd

A simple docker container for running [statsd](https://github.com/etsy/statsd/), configured
via etcd and confd.

## Usage

Ensure that you have [carbon](https://github.com/ejholmes/docker-carbon) running prior. Set
the `/carbon/host` key in etcd:

```bash
$ etcdctl set /statsd/hosted_graphite_api_key ABCDEFG1234567890
```

Start up statsd

```bash
$ docker run -d --name statsd --env ETCD=http://$ETCD_IP:4001 \
    -p 8125:8125/udp -p 8126:8126 quay.io/tagplay/statsd
```

Send some metrics to it:

```bash
$ echo -n "example.statsd.counter.changed:10|c" | nc -w 1 -u localhost 8125
```
