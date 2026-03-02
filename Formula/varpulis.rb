class Varpulis < Formula
  desc "Modern streaming analytics engine with advanced pattern detection"
  homepage "https://github.com/varpulis/varpulis"
  version "0.5.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_intel do
      url "https://github.com/varpulis/varpulis/releases/download/v#{version}/varpulis-macos-x86_64"
      sha256 "2b8b6236c880fa248aed7e1d88c5e6681487d7ef3153eaf7fdadd4b695cc3992"
    end

    on_arm do
      url "https://github.com/varpulis/varpulis/releases/download/v#{version}/varpulis-macos-aarch64"
      sha256 "44da69f071c1cab052164d7db6832f0c35eecf0835ab776539f435b1f2356c12"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/varpulis/varpulis/releases/download/v#{version}/varpulis-linux-x86_64"
      sha256 "30107d222500f7f5f9163270dd9514fff08d80652a8e5dc0b07ded9b80976805"
    end

    on_arm do
      url "https://github.com/varpulis/varpulis/releases/download/v#{version}/varpulis-linux-aarch64"
      sha256 "fb2f340aa7565a2e5638542e06fc1dcdadd62c76c35d65ef499bf01a738d076a"
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
