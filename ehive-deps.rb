#Template generated on 2019-07-08 17:24:03 +0100
#Do not edit this file. Modify the relevant config and regenerate

require 'digest'

class EhiveDeps < Formula
  url 'file://'+File.expand_path(__FILE__)
  desc 'Dependencies for the EhiveDeps formula'
  sha256 Digest::SHA256.file(File.expand_path(__FILE__)).hexdigest
  version '2'

  depends_on 'ensembl/external/openjdk-12'

  def install
    File.open('ehive-deps', 'w') { |file|
      file.write '#!/bin/sh'+"\n"
      deps.each do | dep |
        f = dep.to_formula
        file.write "echo "+[f.full_name, f.version, f.prefix].join("\t")+"\n"
      end
    }
    bin.install 'ehive-deps'
  end
end
    