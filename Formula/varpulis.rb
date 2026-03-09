class Varpulis < Formula
  desc "Modern streaming analytics engine with advanced pattern detection"
  homepage "https://github.com/varpulis/varpulis"
  version "0.6.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_intel do
      url "https://github.com/varpulis/varpulis/releases/download/v#{version}/varpulis-macos-x86_64"
      sha256 "4df3f8633d42c769c498601743827d1dd971cbccd8cd8b961cfc681c9d13435b"
    end

    on_arm do
      url "https://github.com/varpulis/varpulis/releases/download/v#{version}/varpulis-macos-aarch64"
      sha256 "a52856678d3df03d00e5a4b19f6392b1a7218369c655480a9c26803971ffcc94"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/varpulis/varpulis/releases/download/v#{version}/varpulis-linux-x86_64"
      sha256 "ccb1d7bfaf3a1b50d848fdbd0537cbd084dd9b087904d0f531ed2ebb0429cf94"
    end

    on_arm do
      url "https://github.com/varpulis/varpulis/releases/download/v#{version}/varpulis-linux-aarch64"
      sha256 "fb0fcb177ae280651a7d83b8ec0b7365317c78680fcc2cdea0ef4595cb4a6799"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      bin.install "varpulis-macos-x86_64" => "varpulis"
    elsif OS.mac? && Hardware::CPU.arm?
      bin.install "varpulis-macos-aarch64" => "varpulis"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "varpulis-linux-x86_64" => "varpulis"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "varpulis-linux-aarch64" => "varpulis"
    end
  end

  test do
    assert_match "varpulis #{version}", shell_output("#{bin}/varpulis --version")
  end
end
