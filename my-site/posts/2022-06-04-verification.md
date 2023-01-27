---
author: Eric Hayden Campbell
date: June 6, 2022
title: Verification is a misnomer
---

When I try to describe what I do to non PL folks I often get a lot of geniune
confusion and skepticism. When I say I try to verify the correctness of programs
I've been asked everything from to "how do you model programs" to "what is correctness"
and "what does it mean to verify a program", and sometimes all three.

Each of these have standard answers. We model _programs_ by doing our best to
write down a formal description of a language that (1) follows the language
specification, or when that fails (2) agrees with the dominant implementation of
the language, or when _that_ fails (3) agrees with our own sense of taste;
_Correctness_ is defined in terms of "specification", which is defined in terms
of a different program in a (usually different, usually declarative) language or
logic, which we call a "specification", and _verification_ means that a computer
checked that the program adheres to the specification.

Now, as practitioners of PL/FM/Verification, we understand that this process
comes with a whole boatload of caveats, which aren't necessarily clear. We
understand that our langauge models may differ in non-trivial ways from the
implemenations that are truly used in the wild (the so-called "reality gap"). We
understand that specifications are hard to come by and may themselves be buggy
(the so-called "specification problem"), and we understand that even when a
computer verifies/certifies a programs correctness, that a whole lot of
unverified code produced that proof itself (the so-called trusted compute base,
or TCB).

But our fancy terms don't obscure the fact that our models and our proofs and
our artifacts often make massive assumptions about the correctness of other bits
of code. Take as an example any Z3-driven dependent type system like F# or Liquid Haskell. 



<!-- something about  Eugene Wigner made the question famous in his 1960 essay, “The Unreasonable Effectiveness of Mathematics in the Natural Sciences.” -->
