class Riddler < Formula
  desc "AI-supervised learning companion for coding interview prep and projects"
  homepage "https://github.com/magic-squire/riddler"
  version "0.234.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/magic-squire/riddler-releases/releases/download/v0.234.9/riddler-macos-arm64.tar.gz"
      sha256 "286529ff561f9ee70c0dd442e356f5d3078a2e15d4b373d802098cadbcc969ec"
    end
  end

  on_linux do
    url "https://github.com/magic-squire/riddler-releases/releases/download/v0.234.9/riddler-linux-x86_64.tar.gz"
    sha256 "7b5d663ccfbd38b0862e66dd0bf39410f7bfdefe99daf8313056833795f47b6b"
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
