# This file is generated. Edit the generator, not the formula:
#
#   python3 scripts/release_artifacts.py homebrew --output Formula/agentchecksum.rb
#
# which reads the version from Cargo.toml and the digests from the release's own
# SHA256SUMS, and refuses to run if either macOS archive is missing.
class Agentchecksum < Formula
  desc "Dependency fingerprint and behavioral regression gate for AI agents"
  homepage "https://github.com/f0rknturkoglu/agentchecksum"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/f0rknturkoglu/agentchecksum/releases/download/v0.1.0/agentchecksum-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "a2dbecf6d874d3b670fd10f1f035f4550776f501c8b4d0013a9c21a30c8edf27"
    else
      url "https://github.com/f0rknturkoglu/agentchecksum/releases/download/v0.1.0/agentchecksum-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "78af59c3f82b77c2c6740e8ef677e0f8e36253d5794ddc3743c2ed5e60cabc64"
    end
  end

  def install
    # Each archive holds one directory named after the asset, with the binary and the
    # two license files in it.
    bin.install "agentchecksum"
  end

  test do
    assert_match "agentchecksum 0.1.0", shell_output("#{bin}/agentchecksum --version")
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end
