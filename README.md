# Homebrew tap for AgentChecksum

```bash
brew tap f0rknturkoglu/tap
brew install f0rknturkoglu/tap/agentchecksum
```

Installs the prebuilt macOS binary from the
[v0.1.0 release](https://github.com/f0rknturkoglu/agentchecksum/releases/tag/v0.1.0):
Apple Silicon on `arm64`, Intel on `x86_64`. Nothing is compiled.

The formula is generated from the release's own `SHA256SUMS` by the repository's release
tooling — edit the generator in
[f0rknturkoglu/agentchecksum](https://github.com/f0rknturkoglu/agentchecksum), not the
formula:

```bash
python3 scripts/release_artifacts.py homebrew --output Formula/agentchecksum.rb
```

AgentChecksum itself: [repository](https://github.com/f0rknturkoglu/agentchecksum) ·
[crates.io](https://crates.io/crates/agentchecksum) · MIT OR Apache-2.0.
