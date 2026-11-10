# packnest 的 Homebrew formula（自有 tap：brew install nekoleamo/packnest/packnest）
#
# formula 名是 packnest，装出来的命令是 pk（brew 允许两者不同名，先例 ripgrep→rg）。
# 由 scripts/gen-manifests.sh 生成，别手改。
class Packnest < Formula
  desc "国内网络开箱可用的多语言运行时安装器（node/pnpm/bun/deno/go/python）"
  homepage "https://gitee.com/null_593_5354/packnest"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.0/packnest_0.7.0_darwin_arm64.tar.gz"
      sha256 "6486dfa108d392ad964adc858a1dfaf3aec685070e0215de6c7e692995ab6a3d"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.0/packnest_0.7.0_darwin_amd64.tar.gz"
      sha256 "5c95e9d3d6416d887c6f497cc45908613f4d8a7c8a7018e96a4ed35513d6e96b"
    end
  end

  on_linux do
    on_arm do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.0/packnest_0.7.0_linux_arm64.tar.gz"
      sha256 "ef75a04e42e420a514005b5d464e43d6679cc2ecf9cb12850adb5cc33d20d818"
    end
    on_intel do
      url "https://gitee.com/null_593_5354/packnest/releases/download/v0.7.0/packnest_0.7.0_linux_amd64.tar.gz"
      sha256 "b43c2ffff214332b1d2309fd3adb17b5402ab2f10f8eb74527d3b4417ccabc9e"
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
