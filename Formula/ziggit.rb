class Ziggit < Formula
  desc "A modern git implementation written in pure Zig — 4-10× faster, 142KB WASM, succinct mode for LLMs"
  homepage "https://github.com/hdresearch/ziggit"
  version "0.1.16"
  license "GPL-2.0-only"

  on_macos do
    on_arm do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-macos-aarch64"
      sha256 "ad09d98fe504222b98e9355345dd69cf16180bba990af2160b617e535a89f9cf"
    end

    on_intel do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-macos-x86_64"
      sha256 "650585647e4a814d09fd9b17a26d11932cbd3fe7a5a2f6a3f2cf11f01186ae29"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-linux-aarch64"
      sha256 "cd41770b16d81cffeb0dbe859133e7ebbbc50ef110469b84b2cce31784c39bed"
    end

    on_intel do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-linux-x86_64"
      sha256 "df5df810fb4fbe0271e18248f68d589a4363f57cfa050a4887cc339b79bf3637"
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
