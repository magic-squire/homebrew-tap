class Riddler < Formula
  desc "AI-supervised learning companion for coding interview prep and projects"
  homepage "https://github.com/magic-squire/riddler"
  version "0.234.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/magic-squire/riddler-releases/releases/download/v0.234.6/riddler-macos-arm64.tar.gz"
      sha256 "3a5d7ba965f2c2a1dd1ccac761210476825203017c3c82dfbe26d4d2750cd2cd"
    end
  end

  on_linux do
    url "https://github.com/magic-squire/riddler-releases/releases/download/v0.234.6/riddler-linux-x86_64.tar.gz"
    sha256 "bdc11a0f17d77d797e40a30fc3f563b1798d6aec32dcd98b7212ccf98754a5ae"
  end

  def install
    dir = Dir["riddler-*"].first
    bin.install "#{dir}/riddler"
    libexec.install "#{dir}/analytics-mcp"
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
