class Varpulis < Formula
  desc "Modern streaming analytics engine with advanced pattern detection"
  homepage "https://github.com/varpulis/varpulis"
  version "0.6.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_intel do
      url "https://github.com/varpulis/varpulis/releases/download/v#{version}/varpulis-macos-x86_64"
      sha256 "15f213975a659f946fca4067696ba33ba3d8b08ac6191ca1f8712c81c0849ff6"
    end

    on_arm do
      url "https://github.com/varpulis/varpulis/releases/download/v#{version}/varpulis-macos-aarch64"
      sha256 "45b0963f34bc58aab95990f749ae532227aec1412bf8690444e71c9afa54f2ec"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/varpulis/varpulis/releases/download/v#{version}/varpulis-linux-x86_64"
      sha256 "04e822063e3b2068c1fd110bcdc317683e6178de0cb2c8612c3750d37f53a1f3"
    end

    on_arm do
      url "https://github.com/varpulis/varpulis/releases/download/v#{version}/varpulis-linux-aarch64"
      sha256 "5bf728fd6ce3b04749e429abb15839ddeefa539d305df00acc5787f7773fc5bc"
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
