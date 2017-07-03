# rundeck-consul-nodes-plugin

Get resource node data from Consul/Serf members

## Installation

1. Download from https://github.com/tkuchiki/rundeck-consul-nodes-plugin/releases
1. `cp consul-nodes-VERSION-plugin.zip ${RDECK_BASE}/libext/`

## Configuration

Edit `/var/rundeck/projects/YOUR_PROJECT/etc/project.properties` or "Simple Configuration", "Edit Configuration File".

```
resources.source.[index].type=consul-nodes
resources.source.[index].service=consul # consul or serf (default: consul)
resources.source.[index].target-statuses=alive|left # regexp for status (default: alive)
resources.source.[index].exclude-nodes="nodename1" # exclude nodes(grep extended regexp)
resources.source.[index].include-nodes="nodename2" # include nodes(grep extended regexp)
```
