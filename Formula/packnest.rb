# packnest 的 Homebrew formula（自有 tap：brew install nekoleamo/packnest/packnest）
#
# formula 名是 packnest，装出来的命令是 pk（brew 允许两者不同名，先例 ripgrep→rg）。
# 由 scripts/gen-manifests.sh 生成，别手改。
class Packnest < Formula
  desc "国内网络开箱可用的多语言运行时安装器（node/pnpm/bun/deno/go/python）"
  homepage "https://gitee.com/null_593_5354/packnest"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.2/packnest_0.7.2_darwin_arm64.tar.gz"
      sha256 "7b2a5c681887655060a6c86218209b48e87e4b0133e232804ea2431f1e952835"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.2/packnest_0.7.2_darwin_amd64.tar.gz"
      sha256 "98f30def7203907f338c4e722afb46e075bedcc3c9d8b7897cd86ae41f2d6dae"
    end
  end

  on_linux do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.2/packnest_0.7.2_linux_arm64.tar.gz"
      sha256 "d1e9ed450dd45194bee4bce30f83e1e3d8c493cc22f44a3f0f703f86e56c849a"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.2/packnest_0.7.2_linux_amd64.tar.gz"
      sha256 "239e9721b53b5c24787438ad0b9f6c4a47538d0456e3b10182e856d2661ab9c2"
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
