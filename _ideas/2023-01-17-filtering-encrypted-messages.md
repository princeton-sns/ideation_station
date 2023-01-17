---
title: Cipherspam
excerpt: Spam filters for ciphertext
author: Shai
status: new
---

In the context of Noise, a possible attack on client availablity can occur if an attacker spams a client's mailbox with messages that will not make sense once decrypted. So, can we "filter" messages that were not properly encrypted ahead of time? Essentially spam filters on encrypted messages.

The setup: the server could check, based on either the public key or some additional public piece of information, whether a message was properly encrypted for its recipient. This *has* to be done without access to the private key on either side of the communication protocol.

**Brainstorm**: maybe sessions have an additional public function value, that would allow an observer to validate ciphertext is properly encrypted. Needs to be one directional or else attackers could "reverse engineer" function to produce spam messages that are not caught. For example, how credit cards have valid numbers-- I think a credit card number is only valid if the sum of all its digits is a multiple of 10. Something of the same sort except not public.

Another idea is to create an encryption protocol such that encrypting a valid ciphertext a second time will produce the same ciphertext back. This is a concept from linear algebra that I don't specifically remember the name of, but essentially applying an operation n number of times the same result as applying it once.
