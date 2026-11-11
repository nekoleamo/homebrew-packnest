# packnest 的 Homebrew formula（自有 tap：brew install nekoleamo/packnest/packnest）
#
# formula 名是 packnest，装出来的命令是 pk（brew 允许两者不同名，先例 ripgrep→rg）。
# 由 scripts/gen-manifests.sh 生成，别手改。
class Packnest < Formula
  desc "国内网络开箱可用的多语言运行时安装器（node/pnpm/bun/go/python）"
  homepage "https://gitee.com/null_593_5354/packnest"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.9.0/packnest_0.9.0_darwin_arm64.tar.gz"
      sha256 "8cc7f1311c2fbe3b1d4868a45d2b407b990b0b3d6bf668e5c9ac9669c75cb0b0"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.9.0/packnest_0.9.0_darwin_amd64.tar.gz"
      sha256 "86717faec56b7eb7dac3686b05c909f63b08d397603e838921b6e53865448b6a"
    end
  end

  on_linux do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.9.0/packnest_0.9.0_linux_arm64.tar.gz"
      sha256 "133e0a1be8212fedb04ca8ffdbdd051c93e0035dc481dcd2a5098638d4f0d1a2"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.9.0/packnest_0.9.0_linux_amd64.tar.gz"
      sha256 "6c0645614d0ad86ee275a496b5339a315bc25041375b809c3656a3a4fd729afe"
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
