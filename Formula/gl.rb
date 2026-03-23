class Gl < Formula
  desc "Decentralized Git CLI with DID-based identity and IPFS storage"
  homepage "https://gitlawb.com"
  license "MIT"
  version "0.3.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ae72b411f2a5f63c2abd4af0dc13a4d30dfff4cae2c76e2dc0fdbf8c7e13179a"
    else
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "71db1cb68e40207e068085ce3c81f8238346da0058d680cc0688d5b95ceb2cca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9e9feb7cd7da7c9aef7134a5d732b7d9c107bfac5e0dc9abec4dd6a68366f5d8"
    else
      url "https://github.com/gitlawb/releases/releases/download/v#{version}/gitlawb-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "096f9a9b1b54e37621e8ffd438628e1e1bc4d1127dee25fd7bc91733a8b58004"
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
