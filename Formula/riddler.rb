class Riddler < Formula
  desc "AI-supervised learning companion for coding interview prep and projects"
  homepage "https://github.com/magic-squire/riddler"
  version "0.234.27"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/magic-squire/riddler-releases/releases/download/v0.234.27/riddler-macos-arm64.tar.gz"
      sha256 "f95aa59601351bf9ff56833cb1dd1d75a12f6d5e9ca49e1a7d4d350680f88fc6"
    end
  end

  on_linux do
    url "https://github.com/magic-squire/riddler-releases/releases/download/v0.234.27/riddler-linux-x86_64.tar.gz"
    sha256 "7f38c7c28a1c444517fe1e2634a97299752790d946379b3128177132fcac7843"
  end

  def install
    bin.install "riddler"
    libexec.install "analytics-mcp"
  end

  def caveats
    <<~EOS
      Riddler requires the Claude CLI to be installed and authenticated:
        https://claude.ai/download

      Start Riddler from the terminal:
        riddler

      Or install the macOS app for a native double-click experience:
        Download Riddler.app from the GitHub release and drag to /Applications.
        https://github.com/magic-squire/riddler-releases/releases/latest

      Closing the Riddler window automatically shuts down the background server.

      Analytics chat requires Node.js 18+ on your PATH.
    EOS
  end

  test do
    assert_match "Riddler", shell_output("#{bin}/riddler --version 2>&1", 0)
  end
end
