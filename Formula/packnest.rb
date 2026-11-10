# packnest 的 Homebrew formula（自有 tap：brew install nekoleamo/packnest/packnest）
#
# formula 名是 packnest，装出来的命令是 pk（brew 允许两者不同名，先例 ripgrep→rg）。
# 由 scripts/gen-manifests.sh 生成，别手改。
class Packnest < Formula
  desc "国内网络开箱可用的多语言运行时安装器（node/pnpm/bun/deno/go/python）"
  homepage "https://gitee.com/null_593_5354/packnest"
  version "0.7.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.8/packnest_0.7.8_darwin_arm64.tar.gz"
      sha256 "403b35f92eb30af1778953fcaacd0daf3c710c4739632ea764d97ac08f085d69"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.8/packnest_0.7.8_darwin_amd64.tar.gz"
      sha256 "84158a17435680fac88d583c5aacc666cb66fac0a6885613f61a9b1d1af106cb"
    end
  end

  on_linux do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.8/packnest_0.7.8_linux_arm64.tar.gz"
      sha256 "5180eef1b85e9ab1c8c45896b1c39cc2126665e8ac532fce5874b2e8936a19cd"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.8/packnest_0.7.8_linux_amd64.tar.gz"
      sha256 "ffbe829d55a233188154b342593bd3a8b2e90d2677e545633d8163226b0fd735"
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
