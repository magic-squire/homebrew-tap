class Riddler < Formula
  desc "AI-supervised learning companion for coding interview prep and projects"
  homepage "https://github.com/magic-squire/riddler"
  version "0.234.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/magic-squire/riddler-releases/releases/download/v0.234.12/riddler-macos-arm64.tar.gz"
      sha256 "2d728e74170e4eb14625425ecaf32ae326f1351a2a8f97b979e72de97595e4bb"
    end
  end

  on_linux do
    url "https://github.com/magic-squire/riddler-releases/releases/download/v0.234.12/riddler-linux-x86_64.tar.gz"
    sha256 "0d52295874c9c061e8a5b8506ce968db189833e76d12858c24ca518c25a42a2c"
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
