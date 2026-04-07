class Ziggit < Formula
  desc "A modern git implementation written in pure Zig — 4-10× faster, 142KB WASM, succinct mode for LLMs"
  homepage "https://github.com/hdresearch/ziggit"
  version "0.1.7"
  license "GPL-2.0-only"

  on_macos do
    on_arm do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-macos-aarch64"
      sha256 "5c8389568072bd960ab25713e0a24d9ae6817907543086a4103f0717c348e6d5"
    end

    on_intel do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-macos-x86_64"
      sha256 "6761265c52423a8d6c9884b75c8abb03758d0e82fff099b5990e10fd5a62f04c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-linux-aarch64"
      sha256 "ceee08d473acf51d120104828be90347db1cc7532d6962a38b162f27d04a82ae"
    end

    on_intel do
      url "https://github.com/hdresearch/ziggit/releases/download/v#{version}/ziggit-linux-x86_64"
      sha256 "82caee46a2cabf23f5a7f22e2efa60d2dcac1981a8992d0e1bd7114036e57b08"
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
