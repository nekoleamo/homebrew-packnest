# packnest 的 Homebrew formula（自有 tap：brew install nekoleamo/packnest/packnest）
#
# formula 名是 packnest，装出来的命令是 pk（brew 允许两者不同名，先例 ripgrep→rg）。
# 由 scripts/gen-manifests.sh 生成，别手改。
class Packnest < Formula
  desc "国内网络开箱可用的多语言运行时安装器（node/pnpm/bun/deno/go/python）"
  homepage "https://gitee.com/null_593_5354/packnest"
  version "0.7.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.7/packnest_0.7.7_darwin_arm64.tar.gz"
      sha256 "15997a60b07b5535c26bc82fd2e8abff9526fe6213c0ce4d8b8c9a67c2f7c8e3"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.7/packnest_0.7.7_darwin_amd64.tar.gz"
      sha256 "1a27ac76f9da70be453e3b4186b15964fde764b6b508e38440deeb8a04dd9862"
    end
  end

  on_linux do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.7/packnest_0.7.7_linux_arm64.tar.gz"
      sha256 "5bb993acf38ca038c81a6e65af4a54caf99c94ae870e4f3080a7451c276c9260"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.7/packnest_0.7.7_linux_amd64.tar.gz"
      sha256 "4abaddbbf9786e61be75528567a8c228498068151042379497b4b2b9a37ed5fa"
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
