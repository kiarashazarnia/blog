---
title: "Estimation: Prediction or Budgeting?"
date: 2026-08-11
tags:
  - idea
  - systems-thinking
  - complex-systems
  - strategy
version: 0.0.0-beta
description: Software teams argue about estimation in two camps — estimate better or abolish it entirely. Complexity science suggests both miss the deeper question: the domain determines whether prediction is even possible, and the domain depends entirely on what kind of work your team actually does.
---

> [!note]- AI Usage Disclosure
> AI helped structure and polish the prose. All opinions are mine.

Every software team I have been part of has had the same argument about estimation. One camp says we need to get better at it — calibrate story points, track velocity, improve forecasting accuracy. The other camp says estimation is waste — abolish story points, count throughput, let the work speak for itself. Both camps are half right, and both miss the question that actually matters: what kind of work are we doing?

The answer changes everything about whether estimation can be a prediction, or whether it is something else entirely.

## The Cynefin lens

Dave Snowden's **Cynefin framework** sorts work into four domains based on how well cause and effect can be understood:

> **Clear** — cause and effect are known to everyone. Follow best practice. Estimation works.
> **Complicated** — cause and effect exist but require expertise to find. Analyze, then act. Estimation works, with expert judgment.
> **Complex** — cause and effect only make sense in retrospect. Probe, sense, respond. Estimation as prediction is not possible.
> **Chaotic** — no patterns at all. Act first, then make sense. Nothing is predictable.

There is a fifth position — **Disorder**, the confused center where you do not yet know which domain you are in. The framework's real value is not the labels but the diagnostic: before you pick a management tool, ask which domain the work lives in. ([Learn more about Cynefin here.](https://thecynefinframework.com/))

The framework's insight is not that some work is harder than other work. It is that different domains demand fundamentally different management approaches. Applying a complicated-domain tool to a complex-domain problem is not a process failure. It is a **category error**.

Which domain a team's work lives in depends entirely on context. A B2C product team building novel features and discovering user behavior lives in the complex domain — the work is unknowable in advance, and you cannot predict what a new integration will cost until you attempt it. A B2G contractor with a defined project specification and well-understood deliverables lives in the complicated domain — estimation works, and works well. A maintenance team patching known systems against known requirements lives closer to clear. The question is not "is software work complex?" but "is *our* work complex, right now, on this project?"

## The category error in practice

And yet, we estimate complex work with complicated-domain tools. Story points, velocity, capacity planning, burndown charts — these are instruments designed for work where cause and effect are knowable in advance. Applied to complex work, they produce numbers. The numbers look precise. They are fiction dressed as science.

I have lived this in two directions.

On one team, the technical problems were genuinely complex — novel systems, uncertain requirements, integration paths nobody had walked before. The business stakeholder wanted Gantt charts and milestone dates. The category error was visible in real time: complex work managed with complicated-domain tools. The estimates were wrong from the day they were written, everyone knew it, and the only honest conversation happened when someone finally asked: "How much are you willing to spend to find out what this actually costs?"

On another team, the work was genuinely predictable — well-understood maintenance, known integrations, a clear roadmap. The team was committed to Kanban and flow metrics and refused to estimate anything. The result was not agility. It was a loss of ambition. Without any timing pressure, the work expanded to fill the available capacity, and performance drifted. The right tool for predictable work was being rejected on principle.

Both teams were wrong, and both were wrong for the same reason: they did not ask which domain the work lived in before choosing their management tools.

## Estimation as budget negotiation

Here is the reframe. In complex domains, what we call "estimation" is not prediction. It is **budget negotiation**.

Business operates on budgets, P&L statements, time-to-market windows, and opportunity costs. An executive who asks "how long will this take?" is not asking for a forecast in the meteorological sense. They are asking: "Should I allocate this budget to this team, or to something else? What am I giving up?"

When an engineer says "this is eight story points," what they are really doing is negotiating a budget envelope — how much time and money the business is willing to spend to discover what this work actually costs. That is not a failure of estimation. That is the honest version of it.

The engineer who treats the estimate as a shared budget for tradeoff decisions — scope, quality, timing, technical debt — is more useful than the one who pretends to predict. The conversation shifts from "will you hit the date?" to "given this budget, what can we learn, and what can we ship?"

## #NoEstimates goes too far

The **#NoEstimates** movement correctly identifies the problem: story points are routinely misused as predictions, velocity becomes a performance metric, and estimation ceremonies consume time that could be spent building. The diagnosis is right.

The prescription — abolish estimation entirely — goes too far. Business needs budgets. Executives need to allocate resources across competing opportunities. Engineers who refuse to engage in that conversation do not escape the negotiation; they lose influence over it. The tradeoffs — scope, quality, technical debt, time-to-market — get made without them.

The mature posture is not to refuse the conversation but to reframe it. Call the estimate what it is: a budget, not a prediction. Negotiate it honestly. Use it to make tradeoff decisions the business understands.

## Technical debt as strategic leverage

> [!tip] Technical debt is not a dirty word
> Ward Cunningham coined the term to describe a deliberate trade: ship now, pay later. Somewhere along the way, "technical debt" became a negative phrase — something to be ashamed of, something to pay down. This is backwards.
>
> Technical debt is an essential engineering skill. A hedge fund manager uses bank debt strategically — borrowing to amplify returns on high-conviction bets. A senior engineer uses technical debt the same way: borrowing time today to ship faster, with a plan to pay it back when the bet pays off. The worst engineers accumulate debt accidentally. The best engineers take it on deliberately, knowing the interest rate and the repayment plan.
>
> The budget negotiation is where this skill lives. "We can ship this in two weeks if we take on some debt, or four weeks if we do it clean" — that is a tradeoff conversation, not an estimation exercise. And it is the conversation that matters most.

## The mature posture

Know which domain your work lives in. Pick the matching tool. Call the negotiation what it is.

For clear and complicated work, estimate honestly. Track velocity. Use the data. The tools work because the domain allows it.

For complex work, stop pretending to predict. Negotiate a budget. Probe, sense, respond. Measure what you learned, not whether you hit a date that was fiction from the start.

This connects to something I wrote about in [[the-root-of-agile]]. Drucker's knowledge worker — the person whose means of production lives between their ears — is exactly the kind of worker Cynefin places in the complex domain. You cannot separate planning from doing when the doing is thinking, and you cannot predict the output of thinking the way you predict the output of an assembly line. The estimate is a budget. The conversation is a negotiation. And the engineer who treats it that way — honestly, strategically, with maturity — is the one the business learns to trust.

## A note on this version

This is a beta. The Cynefin framing is settled in my head; the sourcing and the #NoEstimates counterargument need tightening. For v1 I want to add concrete examples of budget-negotiation conversations that worked, and sharpen the technical debt section with real numbers. Corrections and counterarguments are welcome.

## References and beneficial links

This is not an academic article, so excuse me for not respecting conventional referencing formats. Here are the sources this argument stands on:

- Dave Snowden, [Cynefin framework](https://thecynefinframework.com/) — the domain model at the center of this argument
- Ward Cunningham, [The WyCash Portfolio Management System](https://c2.com/doc/oopsla92/paper.pdf) (1992) — where "technical debt" was coined
- Vasco Duarte, *#NoEstimates* — the movement's most visible argument
- Henrik Kniberg, [Making sense of MVP](https://blog.crisp.se/2016/01/25/henrikkniberg/making-sense-of-mvp) (2016)
