---
author: Eric Campbell
date: June 22, 2019
title: Theoretically Feasible, Practically Exceptional
subtitle: Reflections on the NPI Workshop on the Foundations of Routing
--- 

Computer Science is a unique discipline when it comes to the tension
between theory and practice. In most of the sciences -- most notably
Physics comes to mind -- a common refrain is "that works in theory,
but not in practice". However, in computer science, we have a
different tension, where problems are often theoretically intractable
or unsolvable, but are, in practice, solved every day in a reasonable
amount of time.

A classic example of this is that parsing C++ programs is actually
undecidable, since its template system is Turing complete. However,
C++ programs are parsed (and executed) on a daily basis... In fact, it
is one of the leading languages for systems research. The problem is
theoretically unsolvable, but practically quite fast.

This week at Cornell, my research group hosted [a
workshop](http://network-programming.org/wfr/) that brought together
experts on packet routing from around the world. Theoreticians and
Practitioners alike (and everyone in between) got together to discuss
data plane routing protocols, probabilistic verification tools,
performant dynamic routing algorithms, static/oblivious routing,
low-latency WAN routing, and many other cool routing concepts. Most of
the work presented in this workshop relied on, exploited or explored
this strange tension between the theoretical and the practical.

The main theme that stuck with me across all of the research talks was
that oftentimes the theoretical worst-case or average-case bounds
don't capture how well we can do in practice. Perhaps the research was
organized so neatly because much of it was funded by the same grant,
the _Algorithms in the Field_ NSF grant, designed to fund both
practical systems guided by theoretical algorithms and theoretical
algorithms motivated by practical applications.

I think the cleanest example of the tension between the theoretical
and the practical was between Harald Räcke's talk on Compact
Demand-Oblivious Routing, and Praveen Kumar's talk on Semi-Oblivious
Routing.  Räcke presented a series of complicated routing schemes
based on his 2002 and 2008 papers that provided theoretical bounds on
the latency in the network. He also discussed more recent work on
*Compact Oblivious Routing*, a variation on the problem that tries to
minimize the number of forwarding rules installed on each switch.

All of the papers discuss an on-line algorithm, that is, routing
decisions are processed as the sequence `σ` of requests (e.g. `GET` or
`PUT`) are issued. To theoretically bound evaluate the performance of
these algorithms, they compare their result against the optimal
offline algorithm, which can view all requests in advance, and derive
a routing scheme with *total* information. Räcke explained the O(`log
n`) competitive algorithm, and explained that no algorithm could do
better than `Ω(√(log n))`.

Immediately after, Kumar presented his work that combined Räcke's
early work on oblivious routing (2002, 2008) with an interfering
controller that dynamically recalculated edge weights so that route
selection could be done semi-dynamically, providing near-optimal
traffic engineering performance. He explained that the congestion,
latency, and throughput for the online SMORE routing scheme was either
equal to the offline optimal performance or within 5-15 of optimal. He
also showed consistently better performance than pure oblivious
routing schemes and many other well-known routing schemes (such as
FCC).

This is bonkers! -- but not entirely unsurprising in computer
science. By focusing on the average case, Kumar was able to develop an
extensive framework that, in practice, outperformed the theoretical
state-of-the-art. This tension in Computer Science is common --
Algorithms may be just barely feasible in theory, but then in practice
are exceptionally performant.

I'm curious about the pathological cases. Since SMORE is only
semi-oblivious, it _may_ not be held to the `Ω(√(log n))`-competitive
performance bound the pure oblivious networks are held to – on which
networks and which sequences `σ` does SMORE perform badly? on which
does it perform exceptionally?

In keeping with these questions, SMORE is a perfect marriage of
theoretical computer science and experimental computer science. It is
systems research motivated by and deeply grounded in theory. This is
the kind of Systems Research programme that really excites me. Maybe
that's why I'm working with Nate..?

Also, props to whoever came up with the schedule (Nate? Jen? Praveen?
Jenna?) — during the Q&A portion of Räcke's talk, many of the
attending systems researchers were very curious to know how Oblivious
Routing schemes fared in practice. And then lo! up walked Praveen,
graphs in hand, ready to answer exactly that question...
