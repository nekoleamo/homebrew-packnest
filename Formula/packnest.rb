# packnest 的 Homebrew formula（自有 tap：brew install nekoleamo/packnest/packnest）
#
# formula 名是 packnest，装出来的命令是 pk（brew 允许两者不同名，先例 ripgrep→rg）。
# 由 scripts/gen-manifests.sh 生成，别手改。
class Packnest < Formula
  desc "国内网络开箱可用的多语言运行时安装器（node/pnpm/bun/deno/go/python）"
  homepage "https://gitee.com/null_593_5354/packnest"
  version "0.7.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.5/packnest_0.7.5_darwin_arm64.tar.gz"
      sha256 "62a18859242b7164724c639537bb68a18565efb9cbbac592ca61633410901ea0"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.5/packnest_0.7.5_darwin_amd64.tar.gz"
      sha256 "8f596ed5a20c416ba8f9544adca4936f860a0bb35528c7c27252c9dd53cf5344"
    end
  end

  on_linux do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.5/packnest_0.7.5_linux_arm64.tar.gz"
      sha256 "e531326cdc9ce3b15d4d0adcc160e0545e370d395c53b4e59ed55821e3286810"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.5/packnest_0.7.5_linux_amd64.tar.gz"
      sha256 "a38d0fda8594dc506c037bd2bc11eeadf5a16aa18a3724999697f77b44524b93"
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
