require './lib/anagrams'

describe Anagrams do
  subject(:anagrams) { described_class.new }

  context '#permutations' do
    it 'returns all possible permutations of a word' do
      expect(subject.permutations('dog')).to eq(["dog", "dgo", "odg", "ogd", "gdo", "god"])
    end
  end
end
