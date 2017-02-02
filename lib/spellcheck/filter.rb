module SpellCheck
  class Filter
    TYPO_PATTERN_LIST = {}

    Dir.glob(File.expand_path('../patterns/**/*.yml', __FILE__)) do |f|
      TYPO_PATTERN_LIST.merge!(YAML.load(File.read(f)))
    end

    # @param [String] string to be checked.
    # @return [Hash] check result.
    def self.spellcheck(word)
      expected = TYPO_PATTERN_LIST[word.downcase]

      if expected
        { correct: false, pattern: word, expected: expected }
      else
        { correct: true, pattern: word, expected: '' }
      end
    end
  end
end
