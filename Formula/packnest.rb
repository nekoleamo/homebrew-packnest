# packnest 的 Homebrew formula（自有 tap：brew install nekoleamo/packnest/packnest）
#
# formula 名是 packnest，装出来的命令是 pk（brew 允许两者不同名，先例 ripgrep→rg）。
# 由 scripts/gen-manifests.sh 生成，别手改。
class Packnest < Formula
  desc "国内网络开箱可用的多语言运行时安装器（node/pnpm/bun/deno/go/python）"
  homepage "https://gitee.com/null_593_5354/packnest"
  version "0.7.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.6/packnest_0.7.6_darwin_arm64.tar.gz"
      sha256 "fdd4391cd1a988e329e466adbf5a7d527e03750341b2f2f6f8ed0dff428fac50"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.6/packnest_0.7.6_darwin_amd64.tar.gz"
      sha256 "8fcc33ea711942116da24f03640a6241467a9cb2e990ba99090396b3e0814564"
    end
  end

  on_linux do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.6/packnest_0.7.6_linux_arm64.tar.gz"
      sha256 "0c544b986ee3f3442fe458d6668ddd8b682d2e630a1e390ccf33882919047b54"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.6/packnest_0.7.6_linux_amd64.tar.gz"
      sha256 "ac0ef3138492c1a177f8e6dee1f3ce1656520581e938224eea6343ac361ee128"
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
