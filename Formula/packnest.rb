# packnest 的 Homebrew formula（自有 tap：brew install nekoleamo/packnest/packnest）
#
# formula 名是 packnest，装出来的命令是 pk（brew 允许两者不同名，先例 ripgrep→rg）。
# 由 scripts/gen-manifests.sh 生成，别手改。
class Packnest < Formula
  desc "国内网络开箱可用的多语言运行时安装器（node/pnpm/bun/go/python）"
  homepage "https://gitee.com/null_593_5354/packnest"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.8.0/packnest_0.8.0_darwin_arm64.tar.gz"
      sha256 "a5812220db29db11d8e0bfeeea19b7e69cbc6cc45954bac4fb01a476a581cc52"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.8.0/packnest_0.8.0_darwin_amd64.tar.gz"
      sha256 "d60831f77f83eaec06984e9c4689a6618d99c89620a29f807359bbd8cce78d5c"
    end
  end

  on_linux do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.8.0/packnest_0.8.0_linux_arm64.tar.gz"
      sha256 "14977c706202d35003ab28cbcd5383443c72237880024532cb4368c88cdbfc8e"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.8.0/packnest_0.8.0_linux_amd64.tar.gz"
      sha256 "b8e0cd96be6fac405756b4d26b31708bc3b18094d94b30fc85b0196a7c4d95fb"
    end
  end

  def install
    bin.install "packnest"
    bin.install_symlink "packnest" => "pk"
  end

  test do
    assert_match "packnest v", shell_output("#{bin}/pk --version")
  end
end
