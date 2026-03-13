# Homebrew Centralized Docs Tap

Homebrew tap for [doc_transformer](https://github.com/lprior-repo/centralized-docs) - an AI-optimized documentation indexer.

## Installation

```bash
brew tap lprior-repo/centralized-docs
brew install doc_transformer
```

## Usage

```bash
# Index a documentation directory
doc_transformer index ./docs ./output

# Scrape a website
doc_transformer scrape https://example.com ./output

# Search the index
doc_transformer search ./output "query"
```

## Supported Platforms

- **macOS (Apple Silicon)** - Precompiled binary available
- **macOS (Intel)** - Build from source required
- **Linux (x86_64)** - Download from [releases](https://github.com/lprior-repo/centralized-docs/releases)
- **Windows (x86_64)** - Download from [releases](https://github.com/lprior-repo/centralized-docs/releases)

## What's this?

[doc_transformer](https://github.com/lprior-repo/centralized-docs) transforms documentation into AI-optimized formats (LLMs.txt) for better LLM consumption.
