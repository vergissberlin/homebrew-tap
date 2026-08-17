# typed: false
# frozen_string_literal: true

class Vergissberlin < Formula
  desc "Useless CLI that prints a Berlin skyline and a reason to leave the city"
  homepage "https://github.com/vergissberlin/vergissberlin-cli"
  url "https://github.com/vergissberlin/vergissberlin-cli/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "4e5e9287e78d121323c8b99de29f63ebd00516c5e6c606d3a34e6d323763221c"
  license "MIT"
  head "https://github.com/vergissberlin/vergissberlin-cli.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "ruby"

  def install
    # Install from source (no runtime gem deps). Avoid `gem build` because the
    # gemspec uses `git ls-files`, which is empty in GitHub release archives.
    libexec.install "lib", "bin"
    (bin/"vergissberlin").write_env_script libexec/"bin/vergissberlin",
                                           RUBYLIB: libexec/"lib"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vergissberlin --version")
  end
end
