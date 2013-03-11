# EFS Log Report

The goal of the EFS Log Report project is to gather, aggregate, analyze and
report on EFS usage based on EFS log information.  Currently, the only usage
logs available for EFS are those for EFS over HTTP; however, the architecture
will need to be scalable so that the usage information from NFS servers
themselves can be aggregated and analyzed in the future.

## Design of the initial implementation

There are two basic components of the initial implementation:

1. an aggregation component to get all of the logs into a single store
2. an extension to [AWStats][AWStats] for the graphical viewing component

## What reports are needed?
## How do we intend to scale to the NFS servers?


# Log aggregation and store

Since the logfiles (for EFS over HTTP) are lighttpd logfiles, scattered across
multiple servers around the world, we need to aggregate those.   Since the logs
are (presumably) very large, we need to minify them.

## Aggregation

For aggregation, we use an extension to [lighttpd][lighttpd] that allows
specification of facility and priority so that we can then route logs based
on policy.

### lighttpd modifications

We need to be able to specify the facility and priority that lighttpd logs use.
That also requires registration of those values (and sane defaults) in the
lighttpd configuration file parsing.


## Store

Logs go into an [HBase][Hbase] store per region, and are then further
aggregated globally.

# Report generation


[lighttpd] http://www.lighttpd.net/
[Hbase] http://hbase.apache.org/
[AWStats] http://awstats.sourceforge.net/
