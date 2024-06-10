class Wavrw < Formula
  desc "WAV file metadata read/write utility"
  homepage "https://github.com/briandorsey/wavrw"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/briandorsey/wavrw/releases/download/v0.2.0/wavrw-cli-aarch64-apple-darwin.tar.xz"
      sha256 "fc84048a4e3a205700306c52896467e13ed776fb72ac2fdab60476740b0502f7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/briandorsey/wavrw/releases/download/v0.2.0/wavrw-cli-x86_64-apple-darwin.tar.xz"
      sha256 "dc77baa6c7acd6318a330c4d41868b68b23fedf6bef0a78f8d10f5cff68dad45"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/briandorsey/wavrw/releases/download/v0.2.0/wavrw-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "bc3e63e52914a9af70692e1ab7f4173d5058589036d6d06f5f2d0ab706a86cad"
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
