# Terraspin Documentation Website

The official documentation website for [Terraspin](https://github.com/terraspin/terraspin), built with [Hugo](https://gohugo.io/).

## Repository responsibilities

| Repository                                                              | Role                                                                             |
| ----------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| [terraspin/terraspin](https://github.com/terraspin/terraspin)           | Source code &bull; CLI &bull; documentation **content** (`/docs`)                |
| [terraspin/terraspin-docs](https://github.com/terraspin/terraspin-docs) | Hugo site &bull; theme &bull; layouts &bull; CSS &bull; assets &bull; deployment |

This repository is **not** the source of truth for documentation content. All guides, command references, and product docs live in the main repository. This repository renders them.

## Documentation workflow

- **To change documentation content** (guides, command reference, concepts)
  → contribute to `terraspin/terraspin` under `/docs`.

- **To change the website** (theme, layout, styling, navigation, search, accessibility)
  → contribute to this repository.

## Local development

### Prerequisites

Install [Hugo](https://gohugo.io/installation/) (extended edition, ≥ 0.140.0):

```bash
# macOS
brew install hugo

# Linux (snap)
snap install hugo

# Or download from https://github.com/gohugoio/hugo/releases
```

### Run locally

```bash
git clone https://github.com/terraspin/terraspin-docs.git
cd terraspin-docs

# Sync documentation content from the main repository
./scripts/sync-docs.sh

# Start the development server
hugo server
```

Open `http://localhost:1313/terraspin-docs/`.

### Production build

```bash
hugo --gc --minify
```

Output is in `public/`.

## Deployment

Deployment is automatic via [GitHub Actions](.github/workflows/deploy.yml). Every push to `main`:

1. Syncs the latest docs from `terraspin/terraspin`
2. Builds the site with Hugo
3. Deploys to GitHub Pages

The site is served at `https://terraspin.github.io/terraspin-docs/`.

## License

This project follows the license of [LICENSE](LICENSE).
