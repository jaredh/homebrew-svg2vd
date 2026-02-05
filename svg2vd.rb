class Svg2vd < Formula
    desc "A tool to convert Scalable Vector Graphics to Android Vector Drawables"
    homepage "https://github.com/jaredh/svg2vd"
    url "https://github.com/jaredh/svg2vd/releases/download/v0.5.1/svg2vd-0.5.1.jar"
    sha256 "465ef7d3b304abef0565492a38659c2ae13673146269b8eaec306a68e32073e4"
    version "0.5.1"
  
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