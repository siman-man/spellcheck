module SpellCheck
  class Typo
    attr_reader :pattern, :expected, :line, :line_number

    def initialize(pattern: nil, expected: nil, line: nil, line_number: nil)
      @pattern = pattern
      @expected = expected
      @line = line
      @line_number = line_number
    end

    def place
      m = line.match(/(?<before>.{0,20})#{pattern}(?<after>.{0,20})/)

      [m[:before] || '', ColorString.red(pattern), m[:after] || ''].join
    end
  end
end
