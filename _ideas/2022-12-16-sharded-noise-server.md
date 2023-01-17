---
title: Sharded Noise Server
excerpt: Scaling a message routing server (perhaps supporting transactions) beyond a single machine without storing or leaking private metadata
author: Shai
status: new
---

This project hopes to scale the noise server by distributing mailboxes across mutliple server instances. However, sharding may expose metadata about the users: for example, if the mailboxes are sharded such that most transactions (message sends) execute on a single shard, then mailboxes with lots of overlapping messages (such as multiple devices for the same user) will end up on the same shard. This creates a privacy issue with regards to how much metadata is leaked through sharding operations.

There's lots of questions to answer: like will there be a need for a central coordinator that stores which mailboxes are where? or can devices send a message to the correct shard to begin with? if the latter what happens if a mailbox moves? or how do we prevent this setup from leaking more information? If the former, how do we make sure metadata tracked for specific accesses does not leak any more user private data?

Can make the case for a federated model where "shards" trade mailboxes as they wish based on some metric, i.e. how much of a transaction on a mailbox is "off-shard"? need to find some sort of private self-balancing metric.   

Big questions:
* Can we distribute without a central coordinator/sequencer?
* How should we distribute mailboxes across "shards"?
* How do we maintain user privacy?
* Can we practically maintain linearizability or relax guarantee with no effects on apps?

