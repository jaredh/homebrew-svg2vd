class Svg2vd < Formula
    desc "A tool to convert Scalable Vector Graphics to Android Vector Drawables"
    homepage "https://github.com/jaredh/svg2vd"
    url "https://github.com/jaredh/svg2vd/releases/download/0.5.0/svg2vd-0.5.0.jar"
    sha256 "7f1b0acb80a5107b62b69836afc32284f365dd9b091763236ec326f9d23e70d5"
    version "0.5.0"
  
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