# packnest 的 Homebrew formula（自有 tap：brew install nekoleamo/packnest/packnest）
#
# formula 名是 packnest，装出来的命令是 pk（brew 允许两者不同名，先例 ripgrep→rg）。
# 由 scripts/gen-manifests.sh 生成，别手改。
class Packnest < Formula
  desc "国内网络开箱可用的多语言运行时安装器（node/pnpm/bun/deno/go/python）"
  homepage "https://gitee.com/null_593_5354/packnest"
  version "0.6.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.6.4/packnest_0.6.4_darwin_arm64.tar.gz"
      sha256 "4a77e1cb36c60a8b8f946e7c30aa629c6b78140a64ffeb34fe3292d580e872dd"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.6.4/packnest_0.6.4_darwin_amd64.tar.gz"
      sha256 "98fe8bb019035ba00a4119b4a30750d22102cce68cc5516c148669ceb80da75a"
    end
  end

  on_linux do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.6.4/packnest_0.6.4_linux_arm64.tar.gz"
      sha256 "5d915e99308a6cb9b276d1e59914bf259c9b54b5f01eec690e2231dbf08f8f50"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.6.4/packnest_0.6.4_linux_amd64.tar.gz"
      sha256 "056ab6ef1dae0a7d9407e719f913317bded1a935ad6947e396dea50ebc36e39e"
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
