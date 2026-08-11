---
title: "AI Strategy, Version Zero"
date: 2026-08-11
tags:
  - strategy
  - systems-thinking
version: 0.0.0-beta
description: "My current take on AI strategy for engineering organizations — a diagnosis of what AI is actually doing to software orgs, four guiding policies, and the actions that follow. Shared as version zero, as part of my own training process."
---

> [!note]- AI Usage Disclosure
> AI helped gather and verify the sources and polish the prose. The strategy and every opinions in it are mine.

The question arrives from every direction now — executives, peers, my own mirror: *what is your AI strategy?* This post is my answer, version zero. I say version zero honestly: I am still training myself on this topic, and writing this is part of that training — my thinking process shared with you, not a settled doctrine. But a strategy that waits for the topic to settle will wait forever, so here is where I stand.

For structure I borrow the strategy kernel from Richard Rumelt's *Good Strategy, Bad Strategy*, in the form Will Larson operationalized[^1] in [*Crafting Engineering Strategy*](https://craftingengstrategy.com/):

> A strategy has three parts: a **diagnosis** — a theory of the nature of the challenge; a **guiding policy** — the approach you will apply to grapple with it; and **coherent actions** — the specific steps the policy directs.

Larson's framing of why this matters: "strategy is the art of reproducibly making good decisions." Here is my diagnosis, my policies, and the actions I think follow.

## Diagnosis

**Building got cheap.** [Base44 — eight people, six months old — sold to Wix for $80M in cash](https://techcrunch.com/2025/06/18/6-month-old-solo-owned-vibe-coder-base44-sells-to-wix-for-80m-cash/), profitable even after paying its LLM token bills. [Lovable crossed $100M ARR eight months after launch with 45 employees](https://techcrunch.com/2025/07/23/eight-months-in-swedish-unicorn-lovable-crosses-the-100m-arr-milestone/). A small team can now become a serious competitor in a quarter. Whatever your moat was, "we can build it and they can't" is no longer part of it.

**The economics surprise big organizations.** [Gartner predicted at least 30% of generative AI projects would be abandoned after proof of concept by end of 2025](https://techcrunch.com/2024/07/31/this-week-in-ai-companies-are-growing-skeptical-of-ais-roi/), with escalating costs among the causes. The coding-tools market shows why: [Cursor had to reprice mid-2025](https://techcrunch.com/2025/07/07/cursor-apologizes-for-unclear-pricing-changes-that-upset-users/) because users burned through monthly allowances in a few prompts, and people inside the industry describe codegen margins as ["neutral or negative"](https://techcrunch.com/2025/08/07/the-high-costs-and-thin-margins-threatening-ai-coding-startups/). [OpenAI's $200/month ChatGPT Pro plan loses money](https://techcrunch.com/2025/01/05/openai-is-losing-money-on-its-pricey-chatgpt-pro-plan-ceo-sam-altman-says/). Token bills scale with use in a way seat licenses never did, and finance departments are noticing.

**Developers passed the point of no return.** [DORA's 2025 report](https://dora.dev/research/2025/dora-report/)[^2]: 90% of tech professionals use AI at work, median two hours a day. Yet only 24% significantly trust the output. Read those two numbers together: usage is near-universal, trust is scarce, and nobody is going back. The strategic question is no longer adoption. It is what the adoption is doing to us.

**AI amplifies what you already have.** [DORA 2024](https://dora.dev/research/2024/dora-report/) found each 25% increase in AI adoption associated with better documentation (+7.5%) and code quality (+3.4%) — and *worse* delivery stability (−7.2%). Thoughtworks CTO Rachel Laycock puts it well: AI "is really just an accelerator of whatever you already have," and without solid delivery practices, "this velocity multiplier becomes a debt accelerator." Adam Tornhill's research, cited in the same [Thoughtworks retreat report](https://martinfowler.com/fragments/2026-02-18.html), found LLM refactoring carried 30% higher defect risk in less-healthy codebases. And [MIT's GenAI Divide report](https://fortune.com/2025/08/18/mit-report-95-percent-generative-ai-pilots-at-companies-failing-cfo/) found roughly 95% of enterprise pilots produce no measurable P&L impact — not because of model quality, but because of a *learning gap* inside the organizations. Small, healthy orgs compound speed. Large, weakly-practiced orgs compound debt — technical and cognitive.

Put the four together and the shape of the challenge emerges: producing code got cheap, and the bottleneck moved downstream — to verifying, judging, and owning. The clearest evidence is [*Writing Code vs. Shipping Code*](https://www.nber.org/papers/w35275), an NBER working paper[^3] (Demirer, Musolff, Yang — MIT economics and Wharton, May 2026) tracking more than 100,000 GitHub developers across three generations of AI tools. Autocomplete, interactive agents, and autonomous agents raised commits by 40%, 140%, and 180% respectively — but the 180% attenuates to 50% more projects and only 30% more releases, and across four app marketplaces there are more new apps but no increase in total usage. The authors name the mechanism the *weak-link hypothesis*: task-level AI gains get absorbed by human bottlenecks deeper in the production chain, with an estimated elasticity of substitution between AI and human effort around 0.25 — strong complementarity, not substitution. Writing code is not shipping code.

The team-level research points the same way: across 106 experiments, [Vaccaro, Almaatouq and Malone](https://www.nature.com/articles/s41562-024-02024-1) found human+AI combinations on average performed *worse* than the best of either alone — when the AI alone was stronger, adding the human hurt (g = −0.54); when humans were stronger, combining helped (g = +0.46). The human contribution is not automatically valuable. It is valuable exactly where human judgment is strong — which is Simon Willison's individual-level observation, that [LLMs amplify existing expertise](https://simonwillison.net/2025/Mar/11/using-llms-for-code/), replayed at org scale. And our self-perception is unreliable: [METR measured experienced developers 19% slower with AI while they believed they were 20% faster](https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/)[^4] (their [2026 follow-up](https://metr.org/blog/2026-02-24-uplift-update/) says newer tools changed the magnitude; the perceptual gap is the durable lesson). The scarce resource in an AI-adopting org is judgment about AI output, and it is unevenly distributed.

## Guiding policy

Six policies.

**1. Hold the strategy itself loosely — re-baseline on a cadence.**

Last year I built a three-agent setup for my own work: a planner, a worker, and a researcher, with explicit handovers between them. It was genuinely good. Then my IDE shipped a built-in explore subagent that was simply better than my researcher, and a chunk of my careful scaffolding became dead weight overnight.

This is now a pattern, not an anecdote. Boris Cherny, who created Claude Code at Anthropic, advises wiping your setup roughly every six months — "delete your claude.md, delete your skills, delete your hooks" — and seeing what the plain model does. His own team [cut about 80% of Claude Code's system prompt](https://www.youtube.com/watch?v=qyPCVqFUyDo) when a stronger model shipped. Scaffolding written to patch a weaker model steers a stronger one badly.

So policy one: any AI strategy that assumes stable tooling is obsolete on arrival. Mine includes its own revision cadence.

**2. Tier by risk — a human owns each tier decision.**

There is no single correct answer to "how much review does AI-written code need?" There is a correct answer per system. Birgitta Böckeler's framing[^5] in [To vibe or not to vibe](https://martinfowler.com/articles/exploring-gen-ai/to-vibe-or-not-vibe.html): assess *probability* (how likely is the AI to get this wrong, in this stack, with this context?), *impact* (what happens if it does?), and *detectability* (will tests, types, and review catch it?) — then calibrate review depth to the combination. The Thoughtworks retreat report names risk tiering "the new core engineering discipline."

My position, plainly: some code can be AI-written, AI-reviewed, and shipped on cheap open-weight models — a dev-environment sandbox, an internal tool — if a responsible engineer explicitly accepts that risk. Some code needs strong models and line-by-line human reading. A small set of systems justifies formal specification or model checking. This is not an all-or-nothing decision for the org, and treating it as one fails in both directions: declare everything critical and you are too slow to compete with the eight-person company; declare everything low-risk and you accumulate cognitive debt while moving fast.

Steve Yegge [argues human code review "has very nearly run its course"](https://yegge.ai/essays/the-shape-of-things-to-come/). I half agree: review *depth* is delegable to the risk tier. Responsibility is not.

**3. Responsibility keeps a human name.**

Will Larson calls it the [*agentic passive voice*](https://lethain.com/agentic-passive-voice/)[^6]: "Claude made an error" is, grammatically, a passive sentence — the actor disappeared. His rule: "whenever the actor in a sentence is a model, then it's a passive sentence."

I think the grammar joke sits on something deeper. My understanding of sociotechnical systems: an organization's problem-solving capacity is a tendency that weakens when it is not exercised. If we stop appreciating the human problem-solving skillset in the loop, initiative atrophies — slowly, then visibly. "Opus did that" is not just imprecise; rehearsed daily, it trains the org's initiative out of the loop. Naming the human — *I shipped this, I own it* — is how the muscle stays trained. The cultural effect compounds in both directions, the way debt does.

This is the same authority-responsibility pairing I wrote about in [[the-root-of-agile]]: you cannot hold someone responsible for outcomes while routing the actual doing elsewhere. The doing and the owning stay together, and both stay human.

**4. Review the investment, not the tokens.**

Someone on your team is burning a large token budget. Are they about to win big for the business, or wasting money? The token count cannot tell you. Neither can the commit count — writing code is not shipping code. DORA has a name for the leaderboard instinct — [tokenmaxxing](https://dora.dev/insights/finding-balance-in-the-era-of-tokenmaxxing/) — and it produces exactly the wrong behavior. The review question is about outcomes: what shipped, what was learned, what the spend bought. Case by case, with feedback, not blanket limits and not blanket judgment. It is the same posture as [[estimation-prediction-or-budgeting]]: a budget conversation, honestly held. Judgment over metering.

**5. Keep the stack multi-solution.**

No vendor lock at any level. At the developer level, different models excel at different tasks — let people use what works. At the team level, risk tiering (policy 2) already implies different models for different tiers. At the organizational level, regulatory requirements may demand in-house or on-premise models for sensitive work. At the company level, strategic independence matters — engineering capacity gated by one provider's pricing, availability, or policy changes is a single point of failure. The architecture should support swapping models, mixing providers, and running local models where the situation calls for it. This is not hedging; it is treating AI tooling the way you would treat any infrastructure dependency you cannot afford to lose.

**6. Back to origins — fundamentals are now economically achievable.**

For decades the industry knew what good engineering looked like: TDD, BDD, thorough test coverage, strong typing, living documentation. The practices were right; the cost was too high. Writing tests, writing specs, writing docs — the mechanical effort was enough that teams routinely skipped it. Now AI collapses that mechanical cost. Matt Pocock [makes the case](https://youtu.be/v4F1gFy-hqg)[^7] plainly: software fundamentals matter more than ever, because the tools that make them affordable have arrived. This might be the golden age of software engineering — not because AI writes the code, but because the practices we always knew were right are now cheap enough to do at scale. The bottleneck was never that these practices didn't work. It was that they cost too much. That bottleneck is dissolving. The policy implication is direct: if your team skipped TDD because it was too slow, try it now. If BDD specs were too expensive to write, they are not anymore. Invest in the fundamentals — they just went on sale.

## Coherent action

Policies without actions are wishes. The actions I think follow:

- **Calendar the re-baseline.** Twice a year, per team: delete the custom scaffolding, retry the workflow with the plain current model, rebuild only what earns its place back.
- **Write the tier list down.** Which systems live in which tier, what review each tier requires, and which named human accepted the risk. Revisit quarterly — tiers drift as tooling improves.
- **Invest in fluency, person by person.** AI fluency varies wildly across any org, and it spreads through pairing and mentorship, not through documents. Larson's [adoption experience at Imprint](https://lethain.com/company-ai-adoption/): treat non-adopters as rational, pave the path, and have senior people lead from the front.
- **Hire and grow systems thinkers.** Netflix CPTO Elizabeth Stone [says systems thinking is now the most important skill she hires for](https://www.lennysnewsletter.com/p/netflix-cpto-on-ai-and-the-future) — generalists for the big wins, with deep specialists still essential for bringing systems up and understanding them when they break. The amplifier diagnosis predicts exactly this: judgment about the whole system is the scarce resource.
- **Review AI spend by outcome, quarterly.** No usage leaderboards. Outcome reviews, in the budget-negotiation sense: what did this spend buy, and should we buy more of it?
- **Abstract the model layer.** Ensure the tooling stack supports swapping models without rewriting workflows. One team, one vendor is a single point of failure — audit where you are locked and plan the exit before you need it.
- **Pilot a fundamentals revival.** Pick one project where TDD or BDD was skipped for cost reasons. Try it now with AI-assisted test and spec generation. Measure the difference — coverage, defect rate, confidence. If the fundamentals just went on sale, prove it on your own codebase.

## A confession, and a note on this version

Version zero, honestly labeled. The diagnosis rests on public data I trust. The policies are mine and less tested. For v1 I want real numbers from tiered review in practice, and a sharper account of the initiative-atrophy claim — right now it is an understanding about sociotechnical systems, not an observation. Corrections and counterarguments are welcome.

## Further reading

This is not an academic article, so excuse me for not respecting conventional referencing formats. The sources cited above, plus additional reading that informed this argument:

1. Richard Rumelt, *Good Strategy, Bad Strategy* — the kernel: diagnosis, guiding policy, coherent action
2. Will Larson, [Crafting Engineering Strategy](https://craftingengstrategy.com/) — the operational version of the kernel; also [The agentic passive voice](https://lethain.com/agentic-passive-voice/) and [Facilitating AI adoption at Imprint](https://lethain.com/company-ai-adoption/)
3. Birgitta Böckeler, the [Exploring Generative AI](https://martinfowler.com/articles/exploring-gen-ai.html) series on martinfowler.com — especially [To vibe or not to vibe](https://martinfowler.com/articles/exploring-gen-ai/to-vibe-or-not-vibe.html) and [How far can we push AI autonomy in code generation?](https://martinfowler.com/articles/pushing-ai-autonomy.html)
4. Martin Fowler, [Fragments: February 18](https://martinfowler.com/fragments/2026-02-18.html) — the Thoughtworks retreat report: risk tiering, Laycock's "debt accelerator," Tornhill's code-health finding
5. DORA — the [2024](https://dora.dev/research/2024/dora-report/) and [2025](https://dora.dev/research/2025/dora-report/) reports, plus [tokenmaxxing](https://dora.dev/insights/finding-balance-in-the-era-of-tokenmaxxing/)
6. MIT Project NANDA, [The GenAI Divide](https://nanda.media.mit.edu/) (2025) — via [Fortune's coverage](https://fortune.com/2025/08/18/mit-report-95-percent-generative-ai-pilots-at-companies-failing-cfo/)
7. Vaccaro, Almaatouq & Malone, [When combinations of humans and AI are useful](https://www.nature.com/articles/s41562-024-02024-1), *Nature Human Behaviour* (2024)
8. Demirer, Musolff & Yang, [Writing Code vs. Shipping Code: Productivity Effects Across Generations of AI Coding Tools](https://www.nber.org/papers/w35275), NBER Working Paper 35275 (May 2026) — the weak-link study; a working paper, not yet peer-reviewed, built on Microsoft/GitHub telemetry
9. METR, [Measuring the impact of early-2025 AI on experienced open-source developer productivity](https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/) and the [2026 uplift update](https://metr.org/blog/2026-02-24-uplift-update/)
10. Boris Cherny at YC Startup School, [We Cut 80% of Claude Code's Prompt](https://www.youtube.com/watch?v=qyPCVqFUyDo)
11. Elizabeth Stone on [Lenny's Podcast](https://www.lennysnewsletter.com/p/netflix-cpto-on-ai-and-the-future) (Jul 2026)
12. Small teams: [Base44 sells to Wix](https://techcrunch.com/2025/06/18/6-month-old-solo-owned-vibe-coder-base44-sells-to-wix-for-80m-cash/), [Lovable crosses $100M ARR](https://techcrunch.com/2025/07/23/eight-months-in-swedish-unicorn-lovable-crosses-the-100m-arr-milestone/)
13. The cost side: [Gartner's abandonment prediction](https://techcrunch.com/2024/07/31/this-week-in-ai-companies-are-growing-skeptical-of-ais-roi/), [Cursor's repricing](https://techcrunch.com/2025/07/07/cursor-apologizes-for-unclear-pricing-changes-that-upset-users/), [codegen margins](https://techcrunch.com/2025/08/07/the-high-costs-and-thin-margins-threatening-ai-coding-startups/), [ChatGPT Pro losses](https://techcrunch.com/2025/01/05/openai-is-losing-money-on-its-pricey-chatgpt-pro-plan-ceo-sam-altman-says/)
14. The counter-poles worth reading: Steve Yegge, [The Continuous Thunderdome](https://yegge.ai/essays/the-shape-of-things-to-come/); Geoffrey Huntley, [everything is a ralph loop](https://ghuntley.com/loop/)
15. Also: Kent Beck, [Augmented Coding: Beyond the Vibes](https://tidyfirst.substack.com/p/augmented-coding-beyond-the-vibes); Simon Willison, [How I use LLMs to help me write code](https://simonwillison.net/2025/Mar/11/using-llms-for-code/); Addy Osmani, [The 70% problem](https://addyo.substack.com/p/the-70-problem-hard-truths-about)
16. Matt Pocock, [Software Fundamentals Matter More Than Ever](https://youtu.be/v4F1gFy-hqg) — the case for TDD, BDD, and fundamentals as AI makes them affordable

[^1]: Richard Rumelt, *Good Strategy, Bad Strategy* (2011). Will Larson operationalizes the kernel in [*Crafting Engineering Strategy*](https://craftingengstrategy.com/).
[^2]: DORA, [*Accelerate State of DevOps Report*](https://dora.dev/research/2025/dora-report/) (2025). See also the [2024 report](https://dora.dev/research/2024/dora-report/).
[^3]: Demirer, Musolff & Yang, [*Writing Code vs. Shipping Code: Productivity Effects Across Generations of AI Coding Tools*](https://www.nber.org/papers/w35275), NBER Working Paper 35275 (May 2026). A working paper, not yet peer-reviewed, built on Microsoft/GitHub telemetry.
[^4]: METR, [*Measuring the impact of early-2025 AI on experienced open-source developer productivity*](https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/) (2025). See also the [2026 follow-up](https://metr.org/blog/2026-02-24-uplift-update/).
[^5]: Birgitta Böckeler, [*To vibe or not to vibe*](https://martinfowler.com/articles/exploring-gen-ai/to-vibe-or-not-vibe.html), part of the [Exploring Generative AI](https://martinfowler.com/articles/exploring-gen-ai.html) series on martinfowler.com.
[^6]: Will Larson, [*The agentic passive voice*](https://lethain.com/agentic-passive-voice/) (2025).
[^7]: Matt Pocock, [*Software Fundamentals Matter More Than Ever*](https://youtu.be/v4F1gFy-hqg).
