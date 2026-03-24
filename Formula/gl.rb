class Gl < Formula
  desc "Decentralized Git CLI with DID-based identity and IPFS storage"
  homepage "https://gitlawb.com"
  license "MIT"
  version "0.3.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "3530dfb114ec44100264947a3a8234cf27f82685c4dd9a7e76b62b7d7d07f7ac"
    else
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "63ffc0f1a81b2133a3ad1df987ed21ffe40629bfa9dae563dbe4da660e5e644a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e696699eac76c16b822e519855ef339424e7031db9ce459884757bd8b8c98293"
    else
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a668f8f1630039d9e862b23282eccf627cf1c187eb797f4484b44339164c1235"
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
