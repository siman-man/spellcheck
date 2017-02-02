module SpellCheck
  class ProofReader

    # @param [String] content text data.
    # @return [SpellCheck::Report] check result.
    def self.check(content)
      report = SpellCheck::Report.new

      content.lines.each.with_index(1) do |line, line_number|

        line.scan(/\w+/).each do |pattern|
          line.chomp!
          result = Filter.spellcheck(pattern)

          next if result[:correct]

          report.errata << Typo.new(
              pattern: pattern,
              expected: result[:expected],
              line: line,
              line_number: line_number
          )
        end
      end

      report
    end
  end
end
