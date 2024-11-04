# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Thinkport < Formula
  desc "This cli tool provides a set of commands related to Thinkport. This is a technical experiement and not intended for production use."
  homepage "https://github.com/vergissberlin/thinkport"
  version "0.0.61"
  license "MIT"
  depends_on :linux

  on_arm do
    if Hardware::CPU.is_64_bit?
      url "https://github.com/vergissberlin/thinkport/releases/download/0.0.61/thinkport_Linux_arm64.tar.gz"
      sha256 "d489370d745647801d919d8216b750c3fdeec4a1469cdb764e139da8951f1087"

      def install
        bin.install "thinkport"
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