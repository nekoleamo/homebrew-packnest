# packnest 的 Homebrew formula（自有 tap：brew install nekoleamo/packnest/packnest）
#
# formula 名是 packnest，装出来的命令是 pk（brew 允许两者不同名，先例 ripgrep→rg）。
# 由 scripts/gen-manifests.sh 生成，别手改。
class Packnest < Formula
  desc "国内网络开箱可用的多语言运行时安装器（node/pnpm/bun/deno/go/python）"
  homepage "https://gitee.com/null_593_5354/packnest"
  version "0.7.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.4/packnest_0.7.4_darwin_arm64.tar.gz"
      sha256 "54d4ea3f19bd3abf52742ec36c86dd8b3afa3acadc7929524c598eb224cab58b"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.4/packnest_0.7.4_darwin_amd64.tar.gz"
      sha256 "4936ea7bec6d43cae468db3bfad317b94c51714be09252e6a4616e11a4be8a09"
    end
  end

  on_linux do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.4/packnest_0.7.4_linux_arm64.tar.gz"
      sha256 "af04caecae2faf0939bc058d5940816bfd6c096284a2a86b474dec9be2cc2d75"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.4/packnest_0.7.4_linux_amd64.tar.gz"
      sha256 "082120f665f1be82564d61e0b6f4772784ae5ca217aabfc8cc6fa994038a686e"
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
