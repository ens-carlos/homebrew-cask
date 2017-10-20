#Template generated on 2017-10-20 14:20:33 +0100
#Do not edit this file. Modify the relevant config and regenerate

require 'digest'

class Web < Formula
  url 'file://'+File.expand_path(__FILE__)
  desc 'Dependencies for the Web formula'
  sha256 Digest::SHA256.file(File.expand_path(__FILE__)).hexdigest
  version '2'

  depends_on 'perl'
  depends_on 'jdk'
  depends_on 'git'
  depends_on 'cmake' => ["without-docs"]
  depends_on 'fontconfig' => ["without-docs"]
  depends_on 'cpanm'
  depends_on 'homebrew/nginx/ngx-devel-kit'
  depends_on 'homebrew/nginx/nginx-full' => ["with-set-misc-module"]
  depends_on 'ensembl/ensembl/percona-client'
  depends_on 'ensembl/web/mod_perl'
  depends_on 'memcached'
  depends_on 'libgd'
  depends_on 'ImageMagick'
  depends_on 'pngcrush'
  depends_on 'ensembl/ensembl/zopfli'
  depends_on 'libsass'
  depends_on 'sassc'
  depends_on 'graphviz'
  depends_on 'homebrew/science/genewise'
  depends_on 'homebrew/science/emboss'
  depends_on 'homebrew/science/htslib'
  depends_on 'homebrew/science/samtools'
  depends_on 'ensembl/ensembl/r2r'
  depends_on 'ensembl/ensembl/hal'
  depends_on 'ensembl/ensembl/bioperl-169'
  depends_on 'ensembl/ensembl/kent'
  depends_on 'ensembl/ensembl/blast'
  depends_on 'ensembl/ensembl/repeatmasker' => ["with-perl", "with-dfam", "without-phrap", "without-repbase"]

  def install
    File.open('web', 'w') { |file|
      file.write '#!/bin/sh'+"\n"
      deps.each do | dep |
        f = dep.to_formula
        file.write "echo "+[f.full_name, f.version, f.prefix].join("\t")+"\n"
      end
    }
    bin.install 'web'
  end
end
    