---
title: "AI Strategy, Version Zero"
date: 2026-08-11
tags:
  - strategy
  - systems-thinking
version: 0.3.1-beta
description: "My current thinking on AI adoption in engineering organizations: what I see happening, the directions I keep returning to, and what I'd consider trying. Shared as version zero, as part of my own learning process."
---

> [!note]- AI Usage Disclosure
> AI helped gather and verify the sources and polish the prose. The strategy and every opinion in it are mine.

The question arrives from every direction now, from executives and peers and my own mirror: *what is your AI strategy?* This post is my attempt at an answer, version zero. I say version zero honestly: I am still learning this topic, and writing is part of how I learn: my thinking process shared with you, not a settled doctrine. A strategy that waits for the topic to settle will wait forever, so here is where my thinking currently sits.

For structure I borrow the strategy kernel from Richard Rumelt's *Good Strategy, Bad Strategy* (2011), in the form Will Larson operationalized in [*Crafting Engineering Strategy*](https://craftingengstrategy.com/):

> A strategy has three parts: a **diagnosis**, a theory of the nature of the challenge; a **guiding policy**, the approach you will apply to grapple with it; and **coherent actions**, the specific steps the policy directs.

Larson's framing of why this matters: "strategy is the art of reproducibly making good decisions." Here is my diagnosis, the directions I keep returning to, and where those directions seem to point.

## Diagnosis

### 1. Building got cheap

[Base44, eight people, six months old, sold to Wix for \$80M in cash](https://techcrunch.com/2025/06/18/6-month-old-solo-owned-vibe-coder-base44-sells-to-wix-for-80m-cash/), profitable even after paying its LLM token bills. [Lovable crossed \$100M ARR eight months after launch with 45 employees](https://techcrunch.com/2025/07/23/eight-months-in-swedish-unicorn-lovable-crosses-the-100m-arr-milestone/). A small team can now become a serious competitor in a quarter. Whatever your moat was, "we can build it and they can't" is no longer part of it.

### 2. The economics surprise big organizations

[Gartner predicted at least 30% of generative AI projects would be abandoned after proof of concept by end of 2025](https://techcrunch.com/2024/07/31/this-week-in-ai-companies-are-growing-skeptical-of-ais-roi/), with escalating costs among the causes. The coding-tools market shows why: [Cursor had to reprice mid-2025](https://techcrunch.com/2025/07/07/cursor-apologizes-for-unclear-pricing-changes-that-upset-users/) because users burned through monthly allowances in a few prompts, and people inside the industry describe codegen margins as ["neutral or negative"](https://techcrunch.com/2025/08/07/the-high-costs-and-thin-margins-threatening-ai-coding-startups/). [OpenAI's \$200/month ChatGPT Pro plan loses money](https://techcrunch.com/2025/01/05/openai-is-losing-money-on-its-pricey-chatgpt-pro-plan-ceo-sam-altman-says/). Token bills scale with use in a way seat licenses never did, and finance departments are noticing.

### 3. Developers passed the point of no return

DORA's 2025 report[^1]: 90% of tech professionals use AI at work, median two hours a day. Yet only 24% significantly trust the output. Read those two numbers together: usage is near-universal, trust is scarce, and nobody is going back. The strategic question is no longer adoption. It is what the adoption is doing to us.

### 4. AI amplifies what you already have

DORA's 2024 report[^2] found each 25% increase in AI adoption associated with better documentation (+7.5%) and code quality (+3.4%), and *worse* delivery stability (−7.2%). Thoughtworks CTO Rachel Laycock puts it well: AI "is really just an accelerator of whatever you already have," and without solid delivery practices, "this velocity multiplier becomes a debt accelerator."[^3] Research cited in the same report found LLM refactoring carried 30% higher defect risk in less-healthy codebases. And MIT's GenAI Divide report[^4] found roughly 95% of enterprise pilots produce no measurable P&L impact, not because of model quality, but because of a *learning gap* inside the organizations. Small, healthy orgs compound speed. Large, weakly-practiced orgs compound debt, technical and cognitive.

### 5. The junior pipeline is collapsing

A study tracking roughly 285,000 U.S. firms from 2015 to 2025[^5] found junior employment at AI-adopting companies declined sharply within six quarters of adoption, driven by slower hiring, not increased separations. Stanford's Digital Economy Lab found employment for developers aged 22–25 down nearly 20% from its 2022 peak, again through reduced hiring rather than separations.[^6] The decline exceeds the post-pandemic correction. The short-term logic is sound: a senior with AI tools outproduces a senior plus juniors. But the long-term consequence is a broken pipeline: fewer juniors today means fewer seniors in five years.

### The shape of the challenge

Put the five together and a shape emerges: producing code got cheap, and the bottleneck moved downstream, to verifying, judging, and owning. The clearest evidence is an NBER working paper[^7] tracking more than 100,000 GitHub developers across three generations of AI tools. Autocomplete, interactive agents, and autonomous agents raised commits by 40%, 140%, and 180% respectively, but the 180% attenuates to 50% more projects and only 30% more releases, and across four app marketplaces there are more new apps but no increase in total usage. The authors name the mechanism the *weak-link hypothesis*: task-level AI gains get absorbed by human bottlenecks deeper in the production chain, with an estimated elasticity of substitution between AI and human effort around 0.25: strong complementarity, not substitution. Writing code is not shipping code.

The team-level research points the same way: one study pooling 106 experiments[^8] found human+AI combinations on average performed *worse* than the best of either alone: when the AI alone was stronger, adding the human hurt (g = −0.54); when humans were stronger, combining helped (g = +0.46). The human contribution is not automatically valuable. It is valuable exactly where human judgment is strong, which replays at org scale the individual-level observation that LLMs amplify existing expertise.[^9] And our self-perception is unreliable: METR measured experienced developers 19% slower with AI while they believed they were 20% faster; their 2026 follow-up found newer tools changed the magnitude, but the perceptual gap is the durable lesson.[^10] The scarce resource in an AI-adopting org is judgment about AI output, and it is unevenly distributed.

## Guiding policy

Six directions I keep returning to.

### 1. Stay adaptive by design: re-baseline on a cadence

Last year I built a three-agent setup for my own work: a planner, a worker, and a researcher, with explicit handovers between them. It was genuinely good. Then my IDE shipped a built-in explore subagent that was simply better than my researcher, and a chunk of my careful scaffolding became dead weight overnight.

This is now a pattern, not an anecdote. Boris Cherny, who created Claude Code at Anthropic, advises wiping your setup roughly every six months ("delete your claude.md, delete your skills, delete your hooks") and seeing what the plain model does. His own team [cut about 80% of Claude Code's system prompt](https://www.youtube.com/watch?v=qyPCVqFUyDo) when a stronger model shipped. Scaffolding written to patch a weaker model steers a stronger one badly.

So the first direction: any thinking that assumes stable tooling is stale on arrival. Mine includes its own revision cadence.

### 2. Tier by risk: a human owns each tier decision

There is no single correct answer to "how much review does AI-written code need?" There is a correct answer per system. Birgitta Böckeler's framing in [To vibe or not to vibe](https://martinfowler.com/articles/exploring-gen-ai/to-vibe-or-not-vibe.html): assess *probability* (how likely is the AI to get this wrong, in this stack, with this context?), *impact* (what happens if it does?), and *detectability* (will tests, types, and review catch it?), then calibrate review depth to the combination. The Thoughtworks retreat report names risk tiering "the new core engineering discipline."[^3]

My position, plainly: some code can be AI-written, AI-reviewed, and shipped on cheap open-weight models (a dev-environment sandbox, an internal tool) if a responsible engineer explicitly accepts that risk. Some code needs strong models and line-by-line human reading. A small set of systems justifies formal specification or model checking. I don't think this is an all-or-nothing decision, and treating it as one seems to fail in both directions: declare everything critical and you are too slow to compete with [[#1. Building got cheap|the eight-person company]]; declare everything low-risk and you accumulate cognitive debt while moving fast.

Steve Yegge [argues human code review "has very nearly run its course"](https://yegge.ai/essays/the-shape-of-things-to-come/). I half agree: review *depth* is delegable to the risk tier. Responsibility is not.

### 3. Responsibility keeps a human name

Will Larson calls it the [*agentic passive voice*](https://lethain.com/agentic-passive-voice/): "Claude made an error" is, grammatically, a passive sentence: the actor disappeared. His rule: "whenever the actor in a sentence is a model, then it's a passive sentence."

I think the grammar joke sits on something deeper. My understanding of sociotechnical systems: an organization's problem-solving capacity is a tendency that weakens when it is not exercised. If we stop appreciating the human problem-solving skillset in the loop, initiative atrophies: slowly, then visibly. "Opus did that" is not just imprecise; rehearsed daily, it trains the org's initiative out of the loop. Naming the human (*I shipped this, I own it*) is how the muscle stays trained. The cultural effect compounds in both directions, the way debt does.

This is the same authority-responsibility pairing I wrote about in [[the-root-of-agile]]: you cannot hold someone responsible for outcomes while routing the actual doing elsewhere. The doing and the owning stay together, and both stay human.

### 4. Review the investment, not the tokens

Someone on your team is burning a large token budget. Are they about to win big for the business, or wasting money? The token count cannot tell you. Neither can the commit count: [[#The shape of the challenge|writing code is not shipping code]]. DORA has a name for the leaderboard instinct, [tokenmaxxing](https://dora.dev/insights/finding-balance-in-the-era-of-tokenmaxxing/), and it produces exactly the wrong behavior. The question worth asking is about outcomes: what shipped, what was learned, what the spend bought. Case by case, with feedback: not blanket limits and not blanket judgment. It is the same posture as [[estimation-prediction-or-budgeting]]: a budget conversation, honestly held. Judgment over metering.

### 5. Choose the tooling shape deliberately

Multi-vendor or single-stack: both poles are defensible, and the right answer depends on context. One org runs multi-solution on purpose, sometimes two tools per engineer. Different models excel at different tasks; [[#2. Tier by risk: a human owns each tier decision|risk tiering]] already implies different models for different tiers; regulation may demand in-house models for sensitive work; and engineering capacity gated by one provider's pricing, availability, or policy changes is a single point of failure. Another org standardizes on one tool and compounds the benefits: shared tooling, shared skills, shared sessions, one security review, one support channel. Fluency spreads faster when everyone uses the same thing.

What I would avoid is drifting into either shape by accident. Pick the pole on purpose, name the tradeoff you are accepting, and keep the architecture able to swap models where the risk justifies it. The mistake is not choosing the wrong pole; it is never choosing.

### 6. Back to origins: fundamentals are now economically achievable

For decades the industry knew what good engineering looked like: TDD, BDD, mutation testing, multi-dimensional coverage (data, branch, condition, logical), strong typing, living documentation. The practices were right; the cost was too high. Writing tests, writing specs, writing mutation suites, writing docs: the mechanical effort was enough that teams routinely skipped it. Now AI collapses that mechanical cost. Matt Pocock [makes the case](https://youtu.be/v4F1gFy-hqg) plainly: software fundamentals matter more than ever, because the tools that make them affordable have arrived. This might be the golden age of software engineering: not because AI writes the code, but because the practices we always knew were right are now cheap enough to do at scale. The bottleneck was never that these practices didn't work. It was that they cost too much. That bottleneck is dissolving. The implication I draw: if a team skipped TDD because it was too slow, it might be worth revisiting. If BDD specs were too expensive to write, they are not anymore. If mutation testing was a luxury only critical systems could justify, maybe reconsider. The fundamentals just went on sale.

## Coherent action

Thinking without action stays abstract. Here is where those directions point in practice: some apply broadly, others depend on org size and context:

1. **Calendar the re-baseline.** This one applies to any team: twice a year, delete the custom scaffolding, retry the workflow with the plain current model, rebuild only what earns its place back.
2. **Write the tier list down.** More relevant for larger organizations with many systems: which systems live in which tier, what review each tier requires, and which named human accepted the risk. Revisit quarterly: tiers drift as tooling improves.
3. **Invest in fluency, person by person.** This applies everywhere: AI fluency varies wildly across any org, and it spreads through pairing and mentorship, not through documents. Larson's [adoption experience at Imprint](https://lethain.com/company-ai-adoption/): treat non-adopters as rational, pave the path, and have senior people lead from the front.
4. **Talent strategy deserves rethinking.** Netflix's CPTO says systems thinking is now the most important skill she hires for[^11]: generalists for the big wins, with deep specialists still essential for bringing systems up and understanding them when they break. [[#4. AI amplifies what you already have|The amplifier diagnosis]] predicts exactly this: judgment about the whole system is the scarce resource.
5. **Review AI spend by outcome.** More relevant for larger orgs where token budgets are opaque: no usage leaderboards, but outcome reviews in the budget-negotiation sense: what did this spend buy, and should we buy more of it?
6. **Make the tooling shape an explicit decision.** Any org size: list what you actually run today, team by team, and ask whether that shape was ever chosen. If you standardize on one stack, invest in the shared practices that make it pay off. If you run multi-vendor, make sure the architecture can swap models without rewriting workflows. Either way, revisit the decision on the [[#1. Stay adaptive by design: re-baseline on a cadence|re-baseline cadence]].
7. **Pilot a fundamentals revival.** This one applies to any team: pick one project where TDD or BDD was skipped for cost reasons. Try it now with AI-assisted test and spec generation. Go further: add mutation testing, measure data coverage alongside branch and condition coverage, generate logical-path tests. Measure the difference: coverage depth, defect rate, confidence. If the fundamentals just went on sale, prove it on your own codebase.
8. **Rethink the talent pipeline.** The answer depends on context. For a large enterprise, [[#5. The junior pipeline is collapsing|the pipeline collapse]] is a contrarian opening: hire and grow junior talent while others pull back, at better economics than pre-AI, because each junior paired with AI tools and strong mentorship can ramp faster. The junior and internship programs are the place to start. For any company, the atomic team model (fewer than three people, deeply skilled, AI-augmented) is worth exploring as a unit of innovation. Either way, pair the investment with deliberate focus on the human practices AI cannot replace: design thinking, pair programming, mentorship, and face-to-face problem-solving. That is where the judgment muscle gets built.

## A confession, and a note on this version

Version zero, honestly labeled. The diagnosis rests on public data I trust. The directions I've outlined are mine and less tested; they are where my thinking currently sits, not where it has arrived. For v1 I want real numbers from tiered review in practice, and a sharper account of the initiative-atrophy claim; right now it is an understanding about sociotechnical systems, not an observation. Corrections and counterarguments are welcome.

## Further reading

These didn't shape the article directly, and I couldn't quote them cleanly, but they inspired my thinking while writing it. Shared for future learning:

- Geoffrey Huntley, [everything is a ralph loop](https://ghuntley.com/loop/)
- Kent Beck, [Augmented Coding: Beyond the Vibes](https://tidyfirst.substack.com/p/augmented-coding-beyond-the-vibes)
- Addy Osmani, [The 70% problem](https://addyo.substack.com/p/the-70-problem-hard-truths-about)
- Birgitta Böckeler, [How far can we push AI autonomy in code generation?](https://martinfowler.com/articles/pushing-ai-autonomy.html)

[^1]: DORA, [*Accelerate State of DevOps Report 2025*](https://dora.dev/research/2025/dora-report/) (2025).
[^2]: DORA, [*Accelerate State of DevOps Report 2024*](https://dora.dev/research/2024/dora-report/) (2024).
[^3]: Martin Fowler, [Fragments: February 18](https://martinfowler.com/fragments/2026-02-18.html) (2026): the writeup of a Thoughtworks retreat on AI in software delivery. Laycock's "debt accelerator" quote, Adam Tornhill's code-health research on LLM refactoring, and the risk-tiering line are all from it.
[^4]: MIT Project NANDA, [*The GenAI Divide*](https://nanda.media.mit.edu/) (2025), via [Fortune's coverage](https://fortune.com/2025/08/18/mit-report-95-percent-generative-ai-pilots-at-companies-failing-cfo/).
[^5]: Seyed Mahdi Hosseini Maasoum & Guy Lichtinger, [*Generative AI as Seniority-Biased Technological Change: Evidence from U.S. Résumé and Job Posting Data*](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5425555) (2025). The most careful study I have seen on this question; also presented at Stanford's Digital Economy Lab, January 2026.
[^6]: Erik Brynjolfsson, Bharat Chandar & Ruyu Chen, [*Canaries in the Coal Mine? Six Facts about the Recent Employment Effects of Artificial Intelligence*](https://digitaleconomy.stanford.edu/publications/canaries-in-the-coal-mine/), Stanford Digital Economy Lab (2025, revised August 2026). The revised version puts the gap for workers aged 22–25 in AI-exposed occupations at 19% below trend, still widening.
[^7]: Demirer, Musolff & Yang (MIT economics and Wharton), [*Writing Code vs. Shipping Code: Productivity Effects Across Generations of AI Coding Tools*](https://www.nber.org/papers/w35275), NBER Working Paper 35275 (May 2026). A working paper, not yet peer-reviewed, built on Microsoft/GitHub telemetry.
[^8]: Vaccaro, Almaatouq & Malone, [*When combinations of humans and AI are useful*](https://www.nature.com/articles/s41562-024-02024-1), *Nature Human Behaviour* (2024).
[^9]: Simon Willison, [How I use LLMs to help me write code](https://simonwillison.net/2025/Mar/11/using-llms-for-code/) (2025). The individual-level version of the same observation.
[^10]: METR, [Measuring the impact of early-2025 AI on experienced open-source developer productivity](https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/) (2025), with the [2026 uplift update](https://metr.org/blog/2026-02-24-uplift-update/).
[^11]: Elizabeth Stone on [Lenny's Podcast](https://www.lennysnewsletter.com/p/netflix-cpto-on-ai-and-the-future) (July 2026).
