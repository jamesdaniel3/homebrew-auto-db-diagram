class DbDiagram < Formula
  desc "A command-line tool that allows for connecting to and automatically diagramming SQL database instances"
  homepage "https://github.com/jamesdaniel3/auto-db-diagram"
  url "https://github.com/jamesdaniel3/auto-db-diagram/archive/v2.1.0.tar.gz"
  sha256 "0de591b6e47a02afb85ed3ba813466b616ba4dc0c946becb6cac608e8f7de545"
  license "MIT"
  
  depends_on "jq"
  depends_on "postgresql" 
  depends_on "graphviz"
  depends_on "python@3.11"
  
  def install
    # Install everything except the man page to libexec
    libexec.install Dir["*"] - ["db-diagram.1"]
    
    (bin/"db-diagram").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/main.sh" "$@"
    EOS
  
    # Install the man page directly from source
    man1.install "db-diagram.1"
  end
end