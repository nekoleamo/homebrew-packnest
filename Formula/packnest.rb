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
      sha256 "b5310811769332e94d0b50e402832b3cac353e54ec3f241bbe52d2796f6c0641"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.6.4/packnest_0.6.4_darwin_amd64.tar.gz"
      sha256 "717a2103f4403bbd9f7f498ffb229847ba8a12854f49b53c1a12e47d894f3e34"
    end
  end

  on_linux do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.6.4/packnest_0.6.4_linux_arm64.tar.gz"
      sha256 "1a7d6dc54036086ffb2d6510849ad9a04a73488a968032e8ca0bf05197e57ae0"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.6.4/packnest_0.6.4_linux_amd64.tar.gz"
      sha256 "abd57fe3693b95045a828f0098d0c39e4a3d1018b4284e325151a479faedf015"
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
