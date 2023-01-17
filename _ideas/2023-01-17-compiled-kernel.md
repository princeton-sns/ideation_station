---
title: A Flexible Compiled Kernel
excerpt: Can we tailor a kernel for its deployment environment?
author: Shai
status: new
---

Started from the idea of having a flexible task scheduler based on the architecture. Can be bigger than that. Can replace standard task scheduler with a flexible one that takes in system parameters into decision making.

On a larger scale: build a configurable kernel that determines internal policies based on the architecture of the machine it is running on. In the same vein as specialized kernels that are tailored to specific workloads, why can't a kernel only support the most optimal policies for the context in which it is running? For example, use the architecture context-switch costs as a parameter for task scheduling. 

Could integrate the init system into the kernel config to speed up spin up times/costs. Will also manage some kernel bloating by not allowing reconfiguration after the fact. 

Related works (mostly in the security space aiming to reduce kernel surface area and thus minimize attacks/vulnerabilities):
* [SHARD kernel specialization](https://dl.acm.org/doi/abs/10.1145/3342195.3387526)
* [TCB reduction](https://www.usenix.org/conference/hotdep12/workshop-program/presentation/tartler)
