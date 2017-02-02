module SpellCheck
  class CLI
    def self.run(filepath)
      begin
        report = ProofReader.check(File.read(filepath))

        if report.accept?
          puts ColorString.green('All ok')
        else
          puts report
        end
      rescue Errno::ENOENT => ex
        puts ex.message
      end
    end
  end
end
