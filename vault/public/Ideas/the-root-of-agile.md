---
title: "The Root of Agile: Autonomy for the Knowledge Worker"
date: 2026-08-10
tags:
  - systems-thinking
  - thinking-out-loud
version: 0.0.0-beta
description: Agile's root is not scrum ceremonies or a new bicycle every sprint. It is Drucker's knowledge worker finally getting authority over planning, process, and team shape — and under that definition, classical tools chosen by an autonomous team are agile, while imposed ceremonies are not.
---

> [!note]- AI Usage Disclosure
> The thesis and every opinion here are mine. AI helped me gather and verify the references, and articulate my thoughts into structured, polished prose.

Most teams I have seen practice agile as an inventory of ceremonies: daily standups, two-week sprints, story points, a board with columns, and Henrik Kniberg's famous sketch — the skateboard, the scooter, the bicycle, the motorcycle, the car — where every sprint must end with a slightly better vehicle.

This is the shallow take. Here is mine:

> Agile is not a set of ceremonies. It is the transfer of authority over the work — planning, organization, process, team topology — to the knowledge workers who do it.

Read this way, the popular picture inverts:

> An autonomous team that deliberately chooses classical, plan-driven tools for a project is agile. A team performing flawless scrum with no decision rights is not.

The second team is running command-and-control with a better vocabulary. This is not a hot take for its own sake — it is what you conclude if you follow the idea back to its root. The root is Peter Drucker.

## The root: Drucker and the knowledge worker

In 1943, General Motors invited a young writer named Peter Drucker to study the company from the inside. He got a salary, free run of the organization, and a seat next to CEO Alfred Sloan. The result was *Concept of the Corporation* (1946), and inside it, a recommendation GM did not want to hear: decentralize, push authority down, treat the people inside the corporation as the source of its strength. GM read the book as betrayal. Sloan later wrote his memoir largely as a rebuttal. Japanese manufacturers, meanwhile, read Drucker seriously.

Out of that study grew the observation Drucker spent the next fifty years developing: a new kind of worker was arriving, and everything about managing them would have to be different — planning, evaluation, motivation, all of it. He named the work in *The Landmarks of Tomorrow* (1959) and the worker in *The Effective Executive* (1966): the **knowledge worker**, whose means of production lives between their ears. By *Management Challenges for the 21st Century* (1999), the argument was complete. Management's triumph in the twentieth century was the fiftyfold rise in the productivity of the manual worker; its task in the twenty-first is to raise the productivity of the knowledge worker. And that, Drucker concluded, demands something management had rarely been willing to give: knowledge workers have to manage themselves. They must be treated as an asset, not a cost — not least because they can walk out the door carrying the means of production with them.

Hold that thought and look at what happened in software at the end of the same century.

## The enemy Drucker and Agile share

Frederick Taylor's *The Principles of Scientific Management* (1911) made the defining move of industrial-era management: separate planning from doing. A planning department thinks; the worker executes. Even for manual work this was a bad trade — it bought output at the price of treating people as machines, and labor relations spent a century paying for it. But for knowledge work, Taylorism is not merely costly. It is incoherent. The knowledge required to plan the work lives in the head of the person doing the work. You cannot separate thinking from doing when the doing *is* thinking.

Agile, seen from this angle, is the software industry re-merging what Taylor split. The manifesto is Drucker's argument arriving in engineering, about half a century after the GM study that started it.

## Read the manifesto again

Strip the ceremonies away and the Agile Manifesto's own principles say the quiet part out loud:

> "Build projects around motivated individuals. Give them the environment and support they need, and trust them to get the job done."

> "The best architectures, requirements, and designs emerge from self-organizing teams."

> "At regular intervals, the team reflects on how to become more effective, then tunes and adjusts its behavior accordingly."

The third principle is the giveaway: the team owns not only the work but the *process itself*. The retrospective is the ceremony that grants authority over all the other ceremonies. Scrum, sprints, and dailies are instances a self-governing team may pick up, reshape, or drop. The unit of agile is not the sprint. It is the self-governing team.

## So what about the bicycle?

To be clear: continuous delivery is a genuinely good tool, and often the right one. Kniberg's skateboard-to-car sketch (*Making sense of MVP*, 2016) captures its value well — learn from real users early instead of building the wrong car for three years. My objection is not to the tool but to its promotion into doctrine: the claim that every sprint must ship a bigger vehicle. In the spirit of agile, the bicycle sits in the knowledge worker's toolbox next to the Gantt chart and the daily standup — picked up when the work calls for it, set down when it doesn't. The authority to choose is the constant; the tools vary.

A thought experiment. A team knows its problem well and decides the first genuinely useful release needs three months of focused building: no dailies, no demos, no per-sprint vehicles. A two-week "bicycle" version was technically possible; the team judged it waste, a demo for nobody, and chose depth over ceremony. If that decision was theirs — made with authority, by the people doing the work — then the project is agile by the only definition that matters. And if a project management office had imposed the exact same schedule on them, it would not be. Same plan, opposite organizations.

The same logic covers classical tools. A Gantt chart chosen by the team, for work that genuinely has a fixed shape, is an autonomous decision. A Gantt chart handed down is Taylorism with sticky notes.

## The only question that matters

Which leaves a single diagnostic for any process you meet: **who chose it?**

If the people doing the work adopted the ceremony and can drop it tomorrow, the process is agile — whatever it looks like. If it was imposed, no number of standups will make it so. Judge a process by where the authority sits, not by its inventory of practices.

## A confession, and a note on this version

The argument above is not falsifiable, in Karl Popper's sense: I cannot prove that Drucker's knowledge worker is what the manifesto's seventeen signatories had in mind at Snowbird in 2001, and no document could settle it. What I can offer is weaker but, I think, still worth sharing — this reading is the most coherent one I have found, and it explains both the manifesto's text and the shallow takes that followed. This post is my learning process shared with you, not a settled history lesson.

Hence the beta. The thesis is settled in my head; the sourcing is not. For v1 I want to tighten the historical thread — Drucker's own telling of the GM years, and the lean/Toyota line that runs parallel to it. Corrections and counterarguments are welcome.

## References and beneficial links

This is not an academic article, so excuse me for not respecting conventional referencing formats. Here are the sources this argument stands on:

- Peter Drucker, *Concept of the Corporation* (1946): the GM study
- Peter Drucker, *The Landmarks of Tomorrow* (1959): where "knowledge work" appears
- Peter Drucker, *The Effective Executive* (1966): where the "knowledge worker" gets its name
- Peter Drucker, *Management Challenges for the 21st Century* (1999): knowledge-worker productivity as management's defining task
- Frederick Taylor, *The Principles of Scientific Management* (1911)
- The [Agile Manifesto](https://agilemanifesto.org) and its twelve principles (2001)
- Henrik Kniberg, [Making sense of MVP](https://blog.crisp.se/2016/01/25/henrikkniberg/making-sense-of-mvp) (2016)
