class Riddler < Formula
  desc "AI-supervised learning companion for coding interview prep and projects"
  homepage "https://github.com/magic-squire/riddler"
  version "0.234.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/magic-squire/riddler-releases/releases/download/v0.234.14/riddler-macos-arm64.tar.gz"
      sha256 "0a0015e99a149d910151b63c930b6a6523fcdb4ddec62a5c2495033daca7b121"
    end
  end

  on_linux do
    url "https://github.com/magic-squire/riddler-releases/releases/download/v0.234.14/riddler-linux-x86_64.tar.gz"
    sha256 "9ea487d6dfb9b476305a2b2447b32d6a4594615e7f8eac21c5ca44918b37047d"
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
