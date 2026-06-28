# AGENTS.md

# Terraspin Documentation Website

This repository contains the official documentation website for Terraspin.

## Mission

Build a production-quality documentation website using the latest stable version of Hugo.

The documentation website must feel comparable to modern documentation sites such as:

- Terraform
- OpenTofu
- Go
- Cloudflare
- Stripe

Prioritize:

- simplicity
- readability
- accessibility
- performance
- maintainability
- SEO

This repository is **not** the source of truth for documentation.

The source documentation lives in:

https://github.com/terraspin/terraspin
https://github.com/terraspin/terraspin/tree/main/docs

specifically:

```
/docs
```

Never duplicate documentation manually.

---

# Tech Stack

Use:

- Hugo (latest stable version)
- Hugo Modules where appropriate
- Hugo Pipes
- Latest Hugo best practices
- GitHub Actions for deployment

Avoid unnecessary JavaScript.

Prefer Hugo-native features over custom implementations.

---

# Repository Structure

You may reorganize this repository if necessary to follow the latest Hugo best practices.

Use a clean structure similar to:

```
content/
layouts/
assets/
static/
data/
i18n/
archetypes/
themes/ (only if truly necessary)
```

Avoid creating custom folders unless there is a strong architectural reason.

---

# Documentation Synchronization

The `/docs` directory from the Terraspin repository is the single source of truth.

Implement an automated synchronization strategy.

The website must consume documentation from:

https://github.com/terraspin/terraspin/tree/main/docs

Never manually copy markdown files.

---

# UI Design

Use the design language defined in:

```
.pi/skills/home-page/
```

For the landing page:

Follow exactly:

```
.pi/skills/home-page/example.html
```

For documentation pages:

Follow:

```
.pi/skills/docs-page/example.html
```

The documentation pages should inherit the same visual language as the landing page.

Maintain a consistent spacing system, typography, color palette, and component design.

---

# Branding

The logo is located inside:

```
public/
```

The logo has a transparent background.

Use the logo throughout the website.

On the landing page, create a subtle continuous rotation animation inspired by a spinning rotor.

Requirements:

- smooth
- elegant
- minimal
- GPU accelerated
- CSS transforms only
- no JavaScript animation
- pause animation when reduced-motion is enabled

The animation should communicate the "spin" identity without becoming distracting.

---

# Color System

Use the established Terraspin brand colors.

The overall color language should resemble Terraform.

Follow the palette already established in:

```
.pi/skills/home-page/
```

Maintain strong contrast and accessibility.

---

# Responsiveness

Responsive design is a first-class requirement.

Support:

- mobile
- tablet
- laptop
- desktop
- ultrawide

Design mobile-first.

Avoid layout shifts.

---

# Performance

Optimize aggressively.

Goals:

- Lighthouse Performance > 95
- Accessibility > 95
- Best Practices > 95
- SEO > 95

Optimize:

- images
- fonts
- CSS
- JavaScript
- layout stability

Minimize client-side JavaScript.

Prefer static rendering whenever possible.

---

# Accessibility

Follow WCAG recommendations.

Support:

- keyboard navigation
- visible focus states
- semantic HTML
- proper heading hierarchy
- ARIA only when necessary

---

# Documentation Features

Implement:

- search
- table of contents
- breadcrumbs
- previous / next navigation
- syntax highlighting
- copy code button
- edit-on-GitHub links
- responsive navigation
- dark mode
- automatic sidebar generation

---

# SEO

Every documentation page should include:

- title
- meta description
- canonical URL
- Open Graph metadata
- Twitter Card metadata
- sitemap
- robots.txt

Generate all metadata automatically.

---

# Maintainability

Prefer reusable partials.

Avoid duplicated templates.

Keep components modular.

Document complex architectural decisions.

---

# Development Rules

Always follow the latest stable Hugo documentation.

Do not rely on outdated blog posts or deprecated APIs.

Before introducing a custom implementation, verify whether Hugo already provides an official solution.

Prefer official Hugo capabilities whenever possible.

---

# Definition of Done

A task is complete only if:

- implementation is finished
- responsive behavior is verified
- accessibility is preserved
- no obvious regressions exist
- code follows Hugo best practices
- unnecessary complexity has been removed

---

# Git Workflow

After completing each feature or logical unit of work:

1. Run:

```
/caveman-commit
```

2. Review the generated commit message.

3. Commit the changes immediately.

Keep commits small, focused, and meaningful.

Do not accumulate unrelated changes into a single commit.
