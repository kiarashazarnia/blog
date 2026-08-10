---
name: blog-writing
description: Writing craft for the /root/cause blog — voice calibration, AI-prose avoidance, an opinion-verification gate before drafting, and the draft/polish/format/review workflows. Load for any blog writing or editing task on this repo.
---

## What this skill does

Provides the writing methodology for /root/cause. Content rules (write location, Obsidian markdown, frontmatter, tags, AI-disclosure callout, Quartz limits, Docker tooling) live in `AGENT.md` at the repo root — follow those; this skill does not repeat them.

## Before you write — every time

1. **Calibrate voice:** read 1–2 existing posts in `vault/public/` (e.g. `Testing/types-of-software-performance-testing.md`). Note the first-person, opinionated, technically precise tone; definitions as `>` blockquotes; mermaid/code only when they earn space.
2. **Opinion gate:** before drafting, ask short, specific questions so every claim, take, and emphasis will be *genuinely the author's* — not your guess. Examples: "Is X your actual position, or hold it neutral?", "Name Y as the cause, or leave it open?", "How strong is your opinion on Z?" Batch 2–4; don't interrogate. Don't write the post until the author's opinions are settled.
3. Confirm scope: audience, angle, rough length, workflow (draft / polish / format / review).

## The voice (non-negotiable)

- First person, conversational but precise. Technical without being dry.
- Concrete over abstract. Show the thing, then name it — not the reverse.
- Short, load-bearing sentences. Vary rhythm. Cut every word that isn't doing work.
- Definitions and key distinctions get a `>` blockquote.
- Opinions stated plainly; hedging is not.

## AI-prose tells — never use

Banned words: delve, tapestry, in the world of, in today's fast-paced, it's worth noting that, at the end of the day, a testament to, navigating the complexities, robust/leverage as filler, utilize, furthermore, moreover, in conclusion, let's dive in.

Banned habits: em-dash overuse, empty rhetorical questions, bullet lists that could be prose, hollow transitions, moralizing closers, "not only… but also", stacking three adjectives. If a phrase could appear in any AI's output, rewrite it.

## Workflows

- **Draft:** from the settled angle + key points, write a complete first draft in `drafts/` (or `vault/public/` if asked). Don't publish until asked. Add the AI-disclosure callout per `AGENT.md`.
- **Polish:** sharpen prose, structure, clarity, flow. Preserve the author's voice and opinions — sharpen, don't homogenize. Return a short summary of changes + why.
- **Format:** fix frontmatter, wikilinks, image syntax, callouts, tags per `AGENT.md`. Validate, don't rewrite.
- **Review:** check every claim, definition, formula, diagram for correctness. Flag uncertainty rather than guess. Never invent quotes/citations/facts. Report findings as a list; propose minimal fixes only if asked.

## Guardrails

- Edit `vault/public/` and `drafts/` freely; ask before any `git add`/`commit`/`push` or publish.
- Ask before touching anything under `quartz/` beyond `quartz.config.ts`/`quartz.layout.ts`/`styles/custom.scss`.
- Unsure about Obsidian/Quartz syntax? Search the official docs first.
- Done? Stop. No preamble or summary unless asked.
