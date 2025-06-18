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

    # Debug: List files in buildpath to see what's available
    puts "Files in buildpath: #{Dir.glob("#{buildpath}/*")}"
    
    # Install manpage with more explicit path checking
    manpage_path = "#{buildpath}/db-diagram.1"
    if File.exist?(manpage_path)
      puts "Found manpage at: #{manpage_path}"
      man1.install manpage_path
      puts "Installed manpage to: #{man1}"
    else
      puts "Manpage not found at: #{manpage_path}"
      puts "Available files: #{Dir.glob("#{buildpath}/*.1")}"
    end
  end
end