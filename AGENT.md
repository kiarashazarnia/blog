# Agent Guideline

This repository contains **`/root/cause`**, Kiarash's personal blog.

## Structure
1. `/vault/`: The source of truth for all content. Managed via the Obsidian app by Kiarash.
2. `/quartz/`: A git fork of the official Quartz repository. This handles building the static HTML from vault markdowns. 
3. `/scripts/`: One-command, mostly AI-Generated wrapper scripts for all local build/serve tasks (see "Local Tooling").
4. The site is automatically built and deployed via GitHub Actions when code is pushed to the master (or main) branch. 

## Content Creation & Obsidian Vault
When assisting with writing, summarizing, or formatting notes, adhere to the following:
* **Write location:** ALL public-facing content MUST be created or edited inside `vault/public/`. Never write directly to `quartz/content/`.
* **Markdown Flavor:** Use strict Obsidian-flavored markdown. 
* **Links:** Prefer Obsidian wikilinks (`[[Note Name]]`) over standard markdown links (`[Note](Note.md)`).
* **Images:** Format images as `![[image.png]]`. 
* **Frontmatter:** All published notes should ideally have valid YAML frontmatter at the top.
  ```yaml
  ---
  title: Your Title
  date: YYYY-MM-DD
  tags: [tag1, tag2]
  ---
* **Tags:** Do NOT introduce new tags without asking the user first. Current tags: 
- Reliability 
- Performance 
- Testing
- Personal
- Idea
- Systems Thinking
- Complex Systems
- Strategy

## Quartz Fork Maintenance (MINIMAL CHANGES)
Because the quartz/ folder is a fork that requires upstream updates, changes here must be kept to an **absolute minimum** to avoid merge conflicts.

- Core Rule: NEVER modify files inside quartz/components/, quartz/plugins/, or quartz/util/ unless explicitly requested by the user.
- Configuration: Limit behavioral and layout changes strictly to quartz/quartz.config.ts and quartz/quartz.layout.ts.
- Styling: If the user asks for design changes, ONLY edit quartz/quartz/styles/custom.scss. Do not modify base.scss or variables.scss directly.

## Local Tooling (Docker-First)
- NEVER install Node.js, npm packages, or other toolchains directly on the host machine. Everything runs in Docker via the two wrapper scripts in `/scripts/`. ALWAYS use them instead of hand-written rm/cp/docker pipelines (which hang and leak state). Both are idempotent — re-run freely. If Docker is not running they exit with a clear message: start Docker and re-run.
  ```sh
  ./scripts/build.sh   # full site build, mirrors CI: copies vault/public -> quartz/content, builds in Docker
  ./scripts/serve.sh   # live preview at http://localhost:8080 with hot reload; mounts vault/public
                       # directly so saving a note in Obsidian rebuilds instantly. Ctrl+C stops it.
  ```


## Search if not sure!
- If you are ever unsure about the exact Obsidian/Markdown syntax, Quartz formatting or any syntax, you MUST use your search tool to verify the official Obsidian/Quartz documentation before responding.
