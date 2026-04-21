class Ziggit < Formula
  desc "A modern git implementation written in pure Zig — 4-10× faster, 142KB WASM, succinct mode for LLMs"
  homepage "https://github.com/hdresearch/ziggit"
  version "0.1.17"
  license "GPL-2.0-only"

  on_macos do
    on_arm do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-macos-aarch64"
      sha256 "cec45b1051bacb616650c6ccb2d93ff25a9b062ddd7f541efa4811fc539c44a5"
    end

    on_intel do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-macos-x86_64"
      sha256 "b2edcaadb41726657428fd1fb003d29f769423bbf45c1a40d61c1701aa0956f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-linux-aarch64"
      sha256 "20565bcc1263407a7dbe6b9a8fecd24c2265bcfd9cf422545a9f88b325768c4e"
    end

    on_intel do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-linux-x86_64"
      sha256 "efc4d16a14dfd8c00289f41ec90abc221424264f84e4096ae312550a68ec3481"
    end
  end

  def install
    binary = Dir.glob("ziggit-*").first
    if binary.nil?
      binary = Dir.glob("ziggit*").reject { |f| f.end_with?(".rb") }.first
    end
    bin.install binary => "ziggit"
  end

  test do
    assert_match "git version", shell_output("#{bin}/ziggit --version")
  end
end
