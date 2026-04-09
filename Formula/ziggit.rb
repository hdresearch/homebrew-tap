class Ziggit < Formula
  desc "A modern git implementation written in pure Zig — 4-10× faster, 142KB WASM, succinct mode for LLMs"
  homepage "https://github.com/hdresearch/ziggit"
  version "0.1.13"
  license "GPL-2.0-only"

  on_macos do
    on_arm do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-macos-aarch64"
      sha256 "ff24f7fa5cc85efa33667f723503088c5c08142b4e5eede06172b23622cce034"
    end

    on_intel do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-macos-x86_64"
      sha256 "53adcc236fb3f9457c80344e689574c2dbd986b92247d2df4fcdad2db6d22db9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-linux-aarch64"
      sha256 "2faa2f5affd1d95200270bd2f301e81afbd919e60a9a0381595b7530d966ed84"
    end

    on_intel do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-linux-x86_64"
      sha256 "92be58a5027ae0cb47e533bb26457957a0147b5db9a4c5c0a4a282b82fcc7037"
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
