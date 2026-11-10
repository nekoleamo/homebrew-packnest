# packnest 的 Homebrew formula（自有 tap：brew install nekoleamo/packnest/packnest）
#
# formula 名是 packnest，装出来的命令是 pk（brew 允许两者不同名，先例 ripgrep→rg）。
# 由 scripts/gen-manifests.sh 生成，别手改。
class Packnest < Formula
  desc "国内网络开箱可用的多语言运行时安装器（node/pnpm/bun/deno/go/python）"
  homepage "https://gitee.com/null_593_5354/packnest"
  version "0.7.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.9/packnest_0.7.9_darwin_arm64.tar.gz"
      sha256 "3f85c5395650a75cd03ccfa9cb47e704ad7e1dac5f66bcfa9fde67eae109feef"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.9/packnest_0.7.9_darwin_amd64.tar.gz"
      sha256 "4396a38ef84ccad370e493676338de8bff53976dfeeca81c0b7786896e278e0a"
    end
  end

  on_linux do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.9/packnest_0.7.9_linux_arm64.tar.gz"
      sha256 "ffa6581557078eabcc222dc1d6cc99a2d30525dbd913b7922d1b88f344b56190"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.9/packnest_0.7.9_linux_amd64.tar.gz"
      sha256 "fe5653bdc764091851cb0d0b5091598a615923bc1f0ce6068b918f8bf4f4d2a0"
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
