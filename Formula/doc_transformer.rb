# typed: true
# frozen_string_literal: true

# Doc Transformer - AI-optimized documentation indexer
#
# Usage:
#   brew tap lprior-repo/centralized-docs
#   brew install doc_transformer
#
class DocTransformer < Formula
  desc "AI-optimized documentation indexer for LLMs"
  homepage "https://github.com/lprior-repo/centralized-docs"
  version "6.1.0"
  license "MIT"

  # Supported: macOS ARM, Linux x86_64
  # Unsupported: macOS Intel, Linux ARM (build from source)

  on_macos do
    on_arm do
      url "https://github.com/lprior-repo/centralized-docs/releases/download/v#{version}/doc_transformer-v#{version}-macos-aarch64.tar.gz"
      sha256 "fa37ddb35242053d3efb28d637533be5838f038df7555b535917314f29367ae3"
    end

    on_intel do
      # Mac Intel unsupported - dummy URL that will fail download
      url "https://github.com/lprior-repo/centralized-docs/releases/download/v#{version}/doc_transformer-v#{version}-macos-x86_64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lprior-repo/centralized-docs/releases/download/v#{version}/doc_transformer-v#{version}-linux-x86_64.tar.gz"
      sha256 "50e3b50adee4eb48a3ee11771f5a17cef2962c544c900ade6e7d46b6deb62319"
    end

    on_arm do
      # Linux ARM unsupported - dummy URL
      url "https://github.com/lprior-repo/centralized-docs/releases/download/v#{version}/doc_transformer-v#{version}-linux-aarch64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    # Check for unsupported platforms and provide helpful error
    if OS.mac? && Hardware::CPU.intel?
      odie <<~EOS
        Mac Intel (x86_64) precompiled binaries are not available.

        To build from source:
          git clone https://github.com/lprior-repo/centralized-docs
          cd centralized-docs
          rustup target add x86_64-apple-darwin
          moon run :build

        Or use Rosetta 2 with the ARM binary.
      EOS
    end

    if OS.linux? && Hardware::CPU.arm?
      odie <<~EOS
        Linux ARM builds are not available as precompiled binaries.

        To build from source:
          git clone https://github.com/lprior-repo/centralized-docs
          cd centralized-docs
          moon run :build
      EOS
    end

    bin.install "doc_transformer"
    bin.install "llms_txt_validator" if File.exist?("llms_txt_validator")
  end

  test do
    output = shell_output("#{bin}/doc_transformer --help")
    assert_match "doc_transformer", output
  end
end
