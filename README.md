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

| Platform | Precompiled Binary | Notes |
|----------|-------------------|-------|
| macOS ARM (M1/M2/M3) | ✅ Yes | `brew install` works |
| macOS Intel (x86_64) | ❌ No | Build from source required |
| Linux x86_64 | ✅ Yes | `brew install` works |
| Linux ARM | ❌ No | Build from source required |
| Windows x86_64 | ⚠️ Manual | Download from [releases](https://github.com/lprior-repo/centralized-docs/releases) |

## Building from Source

If your platform doesn't have a precompiled binary:

```bash
git clone https://github.com/lprior-repo/centralized-docs
cd centralized-docs

# Install moon (build tool)
npm install -g @moonrepo/cli

# Build
moon run :build

# Binary will be at target/<your-target>/release/doc_transformer
```

## What's this?

[doc_transformer](https://github.com/lprior-repo/centralized-docs) transforms documentation into AI-optimized formats (LLMs.txt) for better LLM consumption.
