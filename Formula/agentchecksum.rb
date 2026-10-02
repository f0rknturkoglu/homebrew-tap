# This file is generated. Edit the generator, not the formula:
#
#   python3 scripts/release_artifacts.py homebrew --output Formula/agentchecksum.rb
#
# which reads the version from Cargo.toml and the digests from the release's own
# SHA256SUMS, and refuses to run if either macOS archive is missing.
class Agentchecksum < Formula
  desc "Dependency fingerprint and behavioral regression gate for AI agents"
  homepage "https://github.com/f0rknturkoglu/agentchecksum"
  license any_of: ["MIT", "Apache-2.0"]

  # No `version`: both URLs carry `v0.1.1`, and Homebrew reads it from them —
  # `brew audit` reports it as redundant when it is written out. The generator already
  # refuses a tag that disagrees with Cargo.toml, so the version cannot drift.

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/f0rknturkoglu/agentchecksum/releases/download/v0.1.1/agentchecksum-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "20a8286745be07cc9d47a38e60fbb0e464b19e0b91b9754fe10d9a2228e471a0"
    else
      url "https://github.com/f0rknturkoglu/agentchecksum/releases/download/v0.1.1/agentchecksum-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "0df9ffec803d751b966ea5d4e12d8100391073db7d191ab1ecf7fc5b981c687b"
    end
  end

  def install
    # Each archive holds one directory named after the asset, with the binary and the
    # two license files in it.
    bin.install "agentchecksum"
  end

  test do
    assert_match "agentchecksum #{version}", shell_output("#{bin}/agentchecksum --version")
  end
end
