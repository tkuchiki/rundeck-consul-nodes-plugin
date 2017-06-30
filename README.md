# rundeck-consul-nodes-plugin

Get resource node data from Consul members

## Installation

1. Download from https://github.com/tkuchiki/rundeck-consul-nodes-plugin/releases
1. `cp consul-nodes-VERSION-plugin.zip ${RDECK_BASE}/libext/`

## Configuration

Edit `/var/rundeck/projects/YOUR_PROJECT/etc/project.properties` or "Edit Configuration File".

```
resources.source.[index].type=consul-nodes
```
