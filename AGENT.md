# Agent Guideline
This repository contains a personal blog and digital garden.

## Structure
1. `/vault/`: The source of truth for all content. Managed via the Obsidian app.
2. `/quartz/`: A git fork of the official Quartz repository. This handles building the static HTML from vault markdowns. 
3. The site is automatically built and deployed via GitHub Actions when code is pushed to the master (or main) branch.

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

## Quartz Fork Maintenance (MINIMAL CHANGES)
Because the quartz/ folder is a fork that requires upstream updates, changes here must be kept to an absolute minimum to avoid merge conflicts.

- Core Rule: NEVER modify files inside quartz/components/, quartz/plugins/, or quartz/util/ unless explicitly requested by the user.
- Configuration: Limit behavioral and layout changes strictly to quartz/quartz.config.ts and quartz/quartz.layout.ts.
- Styling: If the user asks for design changes, ONLY edit quartz/quartz/styles/custom.scss. Do not modify base.scss or variables.scss directly.

## Search if not sure!
- If you are ever unsure about the exact Obsidian/Markdown syntax, Quartz formatting or any syntax, you MUST use your search tool to verify the official Obsidian/Quartz documentation before responding.
