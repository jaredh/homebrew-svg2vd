class Svg2vd < Formula
    desc "A tool to convert Scalable Vector Graphics to Android Vector Drawables"
    homepage "https://github.com/jaredh/svg2vd"
    url "https://github.com/jaredh/svg2vd/releases/download/0.2/svg2vd-0.2.jar"
    sha256 "6774a9af2b25a839b15d94ac922055a193ad6491ae279e4fa1b1090b1251b480"
    version "0.2"
  
    def install
      lib.install "svg2vd-#{version}.jar"
  
      File.write("svg2vd", wrapper_script)
  
      bin.install "svg2vd"
    end
  
    def wrapper_script; <<~EOS
      #!/bin/bash
      java -jar #{lib}/svg2vd-#{version}.jar "$@"
      EOS
    end
  
    test do
      system "#{bin}/svg2vd", "--version"
    
      version_text = shell_output("#{bin}/svg2vd --version")
      assert_equal "svg2vd version #{version}\n", version_text
    end
  end