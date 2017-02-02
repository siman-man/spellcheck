describe SpellCheck::ProofReader do
  describe '.run' do
    let(:valid_filepath) { File.expand_path('../fixtures/valid.md', __FILE__) }
    let(:invalid_filepath) { File.expand_path('../fixtures/invalid.md', __FILE__) }

    it 'valid text' do
      report = SpellCheck::ProofReader.check(File.read(valid_filepath))

      expect(report.accept?).to be_truthy
      expect(report.typo_count).to eq 0
    end

    it 'invalid text' do
      report = SpellCheck::ProofReader.check(File.read(invalid_filepath))

      expect(report.reject?).to be_truthy
      expect(report.typo_count).to eq 2
    end
  end
end
