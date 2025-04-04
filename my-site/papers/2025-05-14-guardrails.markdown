---
title: "How I learned to stop worrying and love learned OS policies"
authors: Diyanshu Saxena, Jiayi Chen, Sujay Yadalam, Yeonju Ro, Rohit Dwivedula, </br><b>Eric Hayden Campbell</b>, Aditya Akella, Chrostopher J. Rossbach, Michael Swift
month: May 2025
venue: HotOS
descr: "This paper proposes a way to manage learned os policies using Guardrails"
---
While machine learning has been adopted across various fields, its ability to outperform traditional heuristics in operating systems is often met with justified skepticism. Concerns about unsafe decisions, opaque debugging processes, and the challenges of integrating ML into the kernel—given its stringent latency constraints and inherent complexity—make practitioners understandably cautious. This paper introduces _Guardrails for the OS_, a framework that allows kernel developers to declaratively specify system-level properties and define corrective actions to address property violations. The framework facilitates the compilation of these guardrails into monitors capable of running within the kernel. In this work, we establish the foundation for Guardrails, detailing its core abstractions, examining the problem space, and exploring
potential solutions.
