class Wavrw < Formula
  desc "WAV file metadata read/write utility"
  homepage "https://github.com/briandorsey/wavrw"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/briandorsey/wavrw/releases/download/v0.1.0/wavrw-cli-aarch64-apple-darwin.tar.xz"
      sha256 "0510421f357e4327e669d4613abadcc695d967193787503197761857918bd86e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/briandorsey/wavrw/releases/download/v0.1.0/wavrw-cli-x86_64-apple-darwin.tar.xz"
      sha256 "606e27200f10fcfe148435fffc60463bfd421cea5a751e46e0e5dfb914dd30ed"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/briandorsey/wavrw/releases/download/v0.1.0/wavrw-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2ad07562f7af331f1b6e6ee426fce25ed7842ade883f81c02a8b1c60569e7467"
    end
  end
  license "Apache-2.0 OR MIT"

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "wavrw"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "wavrw"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "wavrw"
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
