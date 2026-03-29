class Varpulis < Formula
  desc "Modern streaming analytics engine with advanced pattern detection"
  homepage "https://github.com/varpulis/varpulis"
  version "0.9.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_intel do
      url "https://github.com/varpulis/varpulis/releases/download/v#{version}/varpulis-macos-x86_64"
      sha256 "530275778251d0673913ae1bf3310b4e2e4a815664faecca71779b80514c2c30"
    end

    on_arm do
      url "https://github.com/varpulis/varpulis/releases/download/v#{version}/varpulis-macos-aarch64"
      sha256 "5d37e4698ed570b868e87d71b8bb84f6e9344f5b6533d9c044415da639565314"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/varpulis/varpulis/releases/download/v#{version}/varpulis-linux-x86_64"
      sha256 "52ac465c36f3f3b1aaa2860bc76c38aa49c69dd5d91f9654ec6c37196c12f498"
    end

    on_arm do
      url "https://github.com/varpulis/varpulis/releases/download/v#{version}/varpulis-linux-aarch64"
      sha256 "c37252093a98cb5cb396674d098bc4d273c1abea9382af4ad7aee1b6a9b5951a"
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
