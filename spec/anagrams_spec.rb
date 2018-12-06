require './lib/anagrams'

describe Anagrams do
  subject(:anagrams) { described_class.new }

  context '#permutations' do
    it 'returns all possible permutations of a word' do
      expect(subject.permutations('dog')).to eq(["dog", "dgo", "odg", "ogd", "gdo", "god"])
    end
  end

  context '#binary-search' do
    it 'tests binary search' do
      array = ['odg', 'dgo', 'dog', 'ogd', 'gdo']
      word = 'dog'
      expect(subject.binary_search(array, word)).to eq('dog')
    end
  end

  context '#anagrams' do
    it 'outputs anagrams of word contained in wordlist' do
      expect { subject.anagrams('paste') }.to output("pates\npeats\nspate"\
        "\nsepta\ntapes\ntepas\n").to_stdout
    end
  end
end
