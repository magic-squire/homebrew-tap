class Riddler < Formula
  desc "AI-supervised learning companion for coding interview prep and projects"
  homepage "https://github.com/magic-squire/riddler"
  version "0.234.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/magic-squire/riddler-releases/releases/download/v0.234.7/riddler-macos-arm64.tar.gz"
      sha256 "4c5f41207c23831b03c7d1c81dc833fb501d3eb87b96173802d83100acf461f0"
    end
  end

  on_linux do
    url "https://github.com/magic-squire/riddler-releases/releases/download/v0.234.7/riddler-linux-x86_64.tar.gz"
    sha256 "eb5accbb2bd84c8172fcd3c7e6695e3ab571d5f2aa8a18059682786717fa8f4b"
  end

  def install
    bin.install "riddler"
    libexec.install "analytics-mcp"
  end

  def caveats
    <<~EOS
      Riddler requires the Claude CLI to be installed and authenticated:
        https://claude.ai/download

      Start Riddler:
        riddler

      This opens http://localhost:7700 in your browser.

      Analytics chat is included and starts automatically.
      It requires Node.js 18+ to be available on your PATH.
    EOS
  end

  test do
    assert_match "Riddler", shell_output("#{bin}/riddler --version 2>&1", 0)
  end
end
