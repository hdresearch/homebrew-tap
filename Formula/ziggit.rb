class Ziggit < Formula
  desc "A modern git implementation written in pure Zig — 4-10× faster, 142KB WASM, succinct mode for LLMs"
  homepage "https://github.com/hdresearch/ziggit"
  version "0.1.3"
  license "GPL-2.0-only"

  on_macos do
    on_arm do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-macos-aarch64"
      sha256 "88e625b64d36c7018cfe381491e5f2ca82e3ac43ebf8b7de51a8509fdc4b6d0b"
    end

    on_intel do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-macos-x86_64"
      sha256 "5bc4cce31e010545d94324048fc5758cee0975ae2cfe3498bdb9c844eadeb608"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-linux-aarch64"
      sha256 "64eac4831de4ab5ed4e3bb19155584a2897238ed37c8bfdf74d379ea4d9e9842"
    end

    on_intel do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-linux-x86_64"
      sha256 "a9c251d3cd60062576a425d833ca9b03f65acb7fbebabb65da930365020bcd11"
    end
  end

  def install
    # Downloaded file is a prebuilt binary — find it regardless of name
    binary = Dir.glob("ziggit-*").first
    if binary.nil?
      # Fallback: Homebrew may rename the downloaded file
      binary = Dir.glob("ziggit*").reject { |f| f.end_with?(".rb") }.first
    end
    bin.install binary => "ziggit"
  end

  test do
    assert_match "git version", shell_output("#{bin}/ziggit --version")
  end
end
