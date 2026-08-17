# typed: false
# frozen_string_literal: true

class Vergissberlin < Formula
  desc "Useless CLI that prints a Berlin skyline and a reason to leave the city"
  homepage "https://github.com/vergissberlin/vergissberlin-cli"
  url "https://github.com/vergissberlin/vergissberlin-cli/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "77b2041ff804afd0be557919319c5f5f2d4d7d170d3bb8e786a3052a70425b9f"
  license "MIT"
  head "https://github.com/vergissberlin/vergissberlin-cli.git", branch: "main"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "vergissberlin.gemspec"
    system "gem", "install", "vergissberlin-#{version}.gem", "--no-document"

    bin.install libexec/"bin/vergissberlin"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV.fetch("GEM_HOME", nil))
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vergissberlin --version")
  end
end
