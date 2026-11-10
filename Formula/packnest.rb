# packnest 的 Homebrew formula（自有 tap：brew install nekoleamo/packnest/packnest）
#
# formula 名是 packnest，装出来的命令是 pk（brew 允许两者不同名，先例 ripgrep→rg）。
# 由 scripts/gen-manifests.sh 生成，别手改。
class Packnest < Formula
  desc "国内网络开箱可用的多语言运行时安装器（node/pnpm/bun/deno/go/python）"
  homepage "https://gitee.com/null_593_5354/packnest"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.1/packnest_0.7.1_darwin_arm64.tar.gz"
      sha256 "618d9861e51dd9ac80b604fe4a279fe96d761ef1b393aa683c6a68898945501e"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.1/packnest_0.7.1_darwin_amd64.tar.gz"
      sha256 "494fc60dbf8f714a137132c72356fed591b16b8b66b55067db5334e143064a3b"
    end
  end

  on_linux do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.1/packnest_0.7.1_linux_arm64.tar.gz"
      sha256 "d8563a4f3128098f8fd911e792e03b6d07b6241c19a8f36cf82dbda62a2166d6"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.1/packnest_0.7.1_linux_amd64.tar.gz"
      sha256 "6e5e39a22aab8d90ec8dffcd256bd12363fadfec311e27c7746b5a364289ff0b"
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
