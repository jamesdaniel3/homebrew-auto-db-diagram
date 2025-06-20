class DbDiagram < Formula
  desc "A command-line tool that allows for connecting to and automatically diagramming SQL database instances"
  homepage "https://github.com/jamesdaniel3/auto-db-diagram"
  url "https://github.com/jamesdaniel3/auto-db-diagram/archive/v2.2.0.tar.gz"
  sha256 "4915aacd8752704541a684b831a0a200fd446328b729006ba7a6f246e720c32b"
  license "MIT"
  
  depends_on "jq"
  depends_on "postgresql" 
  depends_on "mysql" 
  depends_on "graphviz"
  depends_on "python@3.11"
  
  def install
    # Install everything except the man page and unnecessary files to libexec
    libexec.install Dir["*"] - ["db-diagram.1", "ERD.png", ".gitignore", "README.md", ".github", "tests"]
    
    (bin/"db-diagram").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/main.sh" "$@"
    EOS
  
    # Install the man page directly from source
    man1.install "db-diagram.1"
  end
end