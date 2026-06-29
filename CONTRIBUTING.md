# Contributing to terraspin-docs

Thanks for your interest in contributing! This guide covers what belongs here and how to work on the documentation website.

## What this repository is

The Hugo-powered website that renders Terraspin's documentation. It handles presentation, not content.

## What belongs here

Contributions that change **how the site looks and works**:

- Hugo layouts and partials
- CSS and styling
- Theme design
- Responsive behavior
- Navigation (sidebar, breadcrumbs, pagination)
- Dark mode
- Search
- JavaScript enhancements
- Accessibility improvements
- SEO metadata
- Performance optimizations
- GitHub Pages deployment config
- Build tooling and scripts

## What does NOT belong here

The following must be contributed to [terraspin/terraspin](https://github.com/terraspin/terraspin) under `/docs`:

- CLI command documentation
- Command reference pages
- API documentation
- Getting-started guides
- Tutorials
- Architecture docs
- Configuration docs
- Provider docs
- Any `.md` content under `content/docs/`

The sync script (`./scripts/sync-docs.sh`) overwrites `content/docs/` from the main repository. Edits made directly to those files in this repository will be lost on the next deploy.

If you're unsure where your change belongs, ask in a [discussion](https://github.com/terraspin/terraspin/discussions).

## Local development workflow

```bash
# Clone and set up
git clone https://github.com/terraspin/terraspin-docs.git
cd terraspin-docs
./scripts/sync-docs.sh

# Start Hugo dev server (live reload)
hugo server

# Before committing: verify a clean production build
hugo --gc --minify
```

Hugo dev server runs at `http://localhost:1313/terraspin-docs/`.

## Pull request guidelines

- One logical change per PR.
- Test responsive behavior (mobile, tablet, desktop).
- Verify accessibility basics (keyboard navigation, contrast, heading hierarchy).
- Prefer Hugo-native features over custom code.
- Avoid adding JavaScript dependencies unless necessary.
- Keep the diff small and focused.

## Questions?

Open a [discussion](https://github.com/terraspin/terraspin/discussions) or an issue in this repository.
