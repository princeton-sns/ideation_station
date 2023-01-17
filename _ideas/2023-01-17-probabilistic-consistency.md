---
title: Probabilistic Consistency
excerpt: Better performance with weaker (but still generally good) consistency guarantees
author: Shai
status: new
---

Eventually consistent systems provide stronger guarantees for some % of operations. What if a system was designed to be linearizable 99% of the time but x10 faster than one that is linearizable 100% of the time? isn't that a worthy trade-off for most systems? If a client using this system *knows* when that 1% of non-linearizable operations happen and react appropriately (drop, retry, etc...), how does that change usability or performance? How do we check when the unlikely happens? and how do we recover quickly and easily?

In the amazon shopping cart example. Eventual consistency is fine. But what if operations on carts were linearizable most of the time, and if not then the client would know and just lag for a second and refresh the page so that a user never notices inconsistencies?
