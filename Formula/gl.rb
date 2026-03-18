class Gl < Formula
  desc "Decentralized Git CLI with DID-based identity and IPFS storage"
  homepage "https://gitlawb.com"
  license "MIT"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1c4d538a2a162ba5e8bfa1194d2210b23acbd9a33920d0b949d86b8f8aaee608"
    else
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "23e73677225c3937971f4dfbbfa3466e23a8ef0511ed896ed0f776f51c59bd7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "03e93c678d881614dd230517520ba4a7605a0fcc31ecb1323e5b41ad094eaaa8"
    else
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e2327093c8fcbcc6151a14be480dac50cda62a63aace84dc14b42f93f0963b53"
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
