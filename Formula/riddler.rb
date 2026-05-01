class Riddler < Formula
  desc "AI-supervised learning companion for coding interview prep and projects"
  homepage "https://github.com/magic-squire/riddler"
  version "0.234.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/magic-squire/riddler/releases/download/v0.234.5/riddler-macos-arm64.tar.gz"
      sha256 "cc714365a490a194216109b0751951ece2393a122aba810deff27a1e6af4549d"
    end
  end

  on_linux do
    url "https://github.com/magic-squire/riddler/releases/download/v0.234.5/riddler-linux-x86_64.tar.gz"
    sha256 "8d35404a7867b2bb2a6713cd946421ffb3a04aabc8e078bb9cc8c9625df8f656"
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
