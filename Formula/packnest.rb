# packnest 的 Homebrew formula（自有 tap：brew install nekoleamo/packnest/packnest）
#
# formula 名是 packnest，装出来的命令是 pk（brew 允许两者不同名，先例 ripgrep→rg）。
# 由 scripts/gen-manifests.sh 生成，别手改。
class Packnest < Formula
  desc "国内网络开箱可用的多语言运行时安装器（node/pnpm/bun/deno/go/python）"
  homepage "https://gitee.com/null_593_5354/packnest"
  version "0.7.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.3/packnest_0.7.3_darwin_arm64.tar.gz"
      sha256 "f677d84e4fa7719d9b46fea5c64557930a32090b9736073a4b8d5eacca983b01"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.3/packnest_0.7.3_darwin_amd64.tar.gz"
      sha256 "3c23bcb7e88d6adf2d1bcdc94117af656af8f053714bfebe33240b99e6dafd4a"
    end
  end

  on_linux do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.3/packnest_0.7.3_linux_arm64.tar.gz"
      sha256 "c1207ef7a66f772ca59dd859db758c00970ce93616d7e34339bc24478c270a91"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.3/packnest_0.7.3_linux_amd64.tar.gz"
      sha256 "d8ca8c1031a90c49e16d6680cdabe38323a58f1fedae4515834cc4643bf8ead9"
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
