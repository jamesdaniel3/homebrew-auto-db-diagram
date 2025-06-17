class DbDiagram < Formula
    desc "A command-line tool that allows for connecting to and automatically diagramming SQL database instances"
    homepage "https://github.com/jamesdaniel3/auto-db-diagram"
    url "https://github.com/jamesdaniel3/auto-db-diagram/archive/v1.0.0.tar.gz"
    sha256 "4af9bb8cd63b5e9226c133301a74406ba9369c1a1b76292fbf33d35c2def56c4"
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