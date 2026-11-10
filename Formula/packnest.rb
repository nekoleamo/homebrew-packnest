# packnest 的 Homebrew formula（自有 tap：brew install nekoleamo/packnest/packnest）
#
# formula 名是 packnest，装出来的命令是 pk（brew 允许两者不同名，先例 ripgrep→rg）。
# 由 scripts/gen-manifests.sh 生成，别手改。
class Packnest < Formula
  desc "国内网络开箱可用的多语言运行时安装器（node/pnpm/bun/deno/go/python）"
  homepage "https://gitee.com/null_593_5354/packnest"
  version "0.6.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.6.6/packnest_0.6.6_darwin_arm64.tar.gz"
      sha256 "cdddc6574e4560bfedf4216ddadf7bfc1204ff5344ef77a740dd46aab4662935"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.6.6/packnest_0.6.6_darwin_amd64.tar.gz"
      sha256 "6ed31d484c4cfd0b7c24b8f399694db10b47fb7f4ef763d40f50b488fdcaada4"
    end
  end

  on_linux do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.6.6/packnest_0.6.6_linux_arm64.tar.gz"
      sha256 "a91b4f6faf026ba022eaa516c62fb3315e554794ad2e67abdf79116e0fd85a7a"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.6.6/packnest_0.6.6_linux_amd64.tar.gz"
      sha256 "b02b23792b6bd5ee666512ba80d12d3022e3193e66e9a763de0cd9dd06fe5cc3"
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
