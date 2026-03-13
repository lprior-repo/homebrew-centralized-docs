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

  # Only Apple Silicon is supported (Mac Intel cross-compilation is broken)
  on_macos do
    on_arm do
      url "https://github.com/lprior-repo/centralized-docs/releases/download/v#{version}/doc_transformer-v#{version}-macos-aarch64.tar.gz"
      sha256 "fa37ddb35242053d3efb28d637533be5838f038df7555b535917314f29367ae3"
    end

    on_intel do
      # Mac Intel not supported - requires building from source
      # See: https://github.com/lprior-repo/centralized-docs
      def caveats
        <<~EOS
          Mac Intel builds are not available as precompiled binaries.
          Please build from source:
            git clone https://github.com/lprior-repo/centralized-docs
            cd centralized-docs
            moon run :build
        EOS
      end
    end
  end

  def install
    bin.install "doc_transformer"
  end

  test do
    assert_match "doc_transformer", shell_output("#{bin}/doc_transformer --help")
  end
end
