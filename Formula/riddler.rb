class Riddler < Formula
  desc "AI-supervised learning companion for coding interview prep and projects"
  homepage "https://github.com/magic-squire/riddler"
  version "0.234.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/magic-squire/riddler-releases/releases/download/v0.234.16/riddler-macos-arm64.tar.gz"
      sha256 "54c58900297ab9b8d5f7d08830bc0cd96b665ddf2315793167a1cbf40c92ea28"
    end
  end

  on_linux do
    url "https://github.com/magic-squire/riddler-releases/releases/download/v0.234.16/riddler-linux-x86_64.tar.gz"
    sha256 "cd37072546b6fc90e139cab8dc19f49bfb436b11871a3913645910b64a5a382d"
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
