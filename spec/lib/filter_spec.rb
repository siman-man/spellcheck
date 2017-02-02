describe SpellCheck::Filter do
  describe '.spellcheck' do
    it 'correct word' do
      result = SpellCheck::Filter.spellcheck('application')

      expect(result[:correct]).to be_truthy
      expect(result[:expected]).to eq ''
    end

    it 'not correct word' do
      result = SpellCheck::Filter.spellcheck('aplication')

      expect(result[:correct]).to be_falsey
      expect(result[:expected]).to eq 'application'
    end
  end
end
