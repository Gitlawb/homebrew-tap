class Gl < Formula
  desc "Decentralized Git CLI with DID-based identity and IPFS storage"
  homepage "https://gitlawb.com"
  license "MIT"
  version "0.3.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "36f661366d25667b85ea15df916e7c3b19c643fe4c1801478c3ee42ceea57e6c"
    else
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4d4c538d040cbfe3c39ba1da8ba6ffaa8026a94b8edfbe198570f08db028e0f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a9e706da8099fd843efaf75ff1c52e8e3505996a67eaf55a969e63d5b84036d3"
    else
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "108a09e34482a1fc58aa8911a8aef0a57a0af075c59f62a1a379e1a30d0db323"
    end
  end

  def install
    bin.install "gl"
    bin.install "git-remote-gitlawb"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gl --version")
  end
end
