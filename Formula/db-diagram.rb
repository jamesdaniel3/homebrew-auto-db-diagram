class DbDiagram < Formula
  desc "A command-line tool that allows for connecting to and automatically diagramming SQL database instances"
  homepage "https://github.com/jamesdaniel3/auto-db-diagram"
  url "https://github.com/jamesdaniel3/auto-db-diagram/archive/v2.0.0.tar.gz"
  sha256 "116e3102bc6813c412b01cf602cc90594c3c436943c8c17db665896de2afbb63"
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

    # install manpage 
    if File.exist?("#{buildpath}/db-diagram.1")
      man1.install "#{buildpath}/db-diagram.1"
    end
  end
end