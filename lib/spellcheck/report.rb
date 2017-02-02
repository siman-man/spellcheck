module SpellCheck
  class Report
    attr_reader :errata

    def initialize
      @errata = []
    end

    def typo_count
      @errata.size
    end

    def accept?
      status == 'Accept'
    end

    def reject?
      !accept?
    end

    def status
      typo_count.zero? ? 'Accept' : 'Reject'
    end

    def to_s
      [
          results,
          conclusions
      ].join("\n\n")
    end

    private

    def results
      header = %w(Location Text Pattern Expected)
      rows = errata.map do |typo|
        [
            typo.line_number,
            typo.place,
            ColorString.red(typo.pattern),
            ColorString.green(typo.expected)
        ]
      end

      Terminal::Table.new(headings: header, rows: rows)
    end

    def conclusions
      ColorString.red("result: #{typo_count} typo found.")
    end
  end
end
