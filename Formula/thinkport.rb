# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Thinkport < Formula
  desc "This cli tool provides a set of commands related to Thinkport. This is a technical experiement and not intended for production use."
  homepage "https://github.com/vergissberlin/thinkport"
  version "0.0.49"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vergissberlin/thinkport/releases/download/0.0.49/thinkport_Darwin_x86_64.tar.gz"
      sha256 "d4c6d477ab551083bc035816e2cac3ec6c46cd1d953ba8c50e2880056d8eeddd"

      def install
        bin.install "thinkport"
        bash_completion.install "completions/thinkport.bash" => "thinkport"
        zsh_completion.install "completions/thinkport.zsh" => "_thinkport"
        fish_completion.install "completions/thinkport.fish"
        man1.install "docs/thinkport-members.1"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/vergissberlin/thinkport/releases/download/0.0.49/thinkport_Darwin_arm64.tar.gz"
      sha256 "67ec3fa40e6a00884786b6877e54b61f8918dd26d619154502b453deeb4c2472"

      def install
        bin.install "thinkport"
        bash_completion.install "completions/thinkport.bash" => "thinkport"
        zsh_completion.install "completions/thinkport.zsh" => "_thinkport"
        fish_completion.install "completions/thinkport.fish"
        man1.install "docs/thinkport-members.1"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/vergissberlin/thinkport/releases/download/0.0.49/thinkport_Linux_arm64.tar.gz"
      sha256 "a886bcbcfd90c0e3f19691441fb6b3008878c5e623efcb96fe036f7e60ec0e62"

      def install
        bin.install "thinkport"
        bash_completion.install "completions/thinkport.bash" => "thinkport"
        zsh_completion.install "completions/thinkport.zsh" => "_thinkport"
        fish_completion.install "completions/thinkport.fish"
        man1.install "docs/thinkport-members.1"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/vergissberlin/thinkport/releases/download/0.0.49/thinkport_Linux_x86_64.tar.gz"
      sha256 "cb0f4b4e1b155f8b1a35f62d940f3a49b40f7ce182b6203947775d7d3c0be528"

      def install
        bin.install "thinkport"
        bash_completion.install "completions/thinkport.bash" => "thinkport"
        zsh_completion.install "completions/thinkport.zsh" => "_thinkport"
        fish_completion.install "completions/thinkport.fish"
        man1.install "docs/thinkport-members.1"
      end
    end
  end

  def caveats
    <<~EOS
      It uses a http client to collect the data. Internetconnection is required.
    EOS
  end

  test do
    system "#{bin}/thinkport -v"
  end
end
