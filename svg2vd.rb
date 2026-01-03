class Svg2vd < Formula
    desc "A tool to convert Scalable Vector Graphics to Android Vector Drawables"
    homepage "https://github.com/jaredh/svg2vd"
    url "https://github.com/jaredh/svg2vd/releases/download/0.4.0/svg2vd-0.4.0.jar"
    sha256 "d6253bf857eebc1532d342ee812314155adcd1c86218ef2d75be295d44d6bbf2"
    version "0.4.0"
  
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