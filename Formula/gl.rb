class Gl < Formula
  desc "Decentralized Git CLI with DID-based identity and IPFS storage"
  homepage "https://gitlawb.com"
  license "MIT"
  version "0.1.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4fe0d4963756c8e706d13aaa042cb2e76ebf9f7c09a83d038783499027d6da83"
    else
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "f1477f3bf6aa9263b1b6a29dcf01f999c61b1e6873ac32d20d785c4e9ff103aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c781bc00324cb9d0da95dbdb1ca384295789b4bea11a290b35908a661771fea6"
    else
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7c9f785c7592334c8c5cd71c492ae60a31e41dea5d5cc346839bc087d212f78b"
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
