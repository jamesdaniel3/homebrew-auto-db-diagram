class DbDiagram < Formula
    desc "A command-line tool that allows for connecting to and automatically diagramming SQL database instances"
    homepage "https://github.com/jamesdaniel3/auto-db-diagrammer"
    url "https://github.com/jamesdaniel3/auto-db-diagrammer/archive/v1.0.0.tar.gz"
    sha256 "..."
    license "MIT"
    
    depends_on "jq"
    depends_on "postgresql" 
    depends_on "graphviz"
    depends_on "python@3.11"
    
    def install
      libexec.install Dir["*"]
      (bin/"db-diagram").write <<~EOS
        #!/bin/bash
        exec "#{libexec}/main.sh" "$@"
      EOS
    end
end