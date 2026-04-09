class Ziggit < Formula
  desc "A modern git implementation written in pure Zig — 4-10× faster, 142KB WASM, succinct mode for LLMs"
  homepage "https://github.com/hdresearch/ziggit"
  version "0.1.11"
  license "GPL-2.0-only"

  on_macos do
    on_arm do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-macos-aarch64"
      sha256 "285612c3746cec4ffc7b0323c92f27261c534313e5db2ea88ec91f41dce5b435"
    end

    on_intel do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-macos-x86_64"
      sha256 "9536efbd52b0c2d0b0cf044b15392344a8033c6fdc641422eff27aaf96adaaff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-linux-aarch64"
      sha256 "50fa65f5c4862e705daa8ff4aaa099844223344679e6a7e763dd3b1d5020b488"
    end

    on_intel do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-linux-x86_64"
      sha256 "7ff5c87d618103653a115396fe255e4823d705ec3d8d2996cb895e57ccacb6b9"
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
