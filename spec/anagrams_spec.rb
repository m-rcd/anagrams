require './lib/anagrams'

describe Anagrams do
  subject(:anagrams) { described_class.new }

  context '#permutations' do
    it 'returns all possible permutations of a word' do
      expect(subject.permutations('dog')).to eq(["dog", "dgo", "odg", "ogd", "gdo", "god"])
    end
  end

  context '#anagrams' do
    it 'outputs anagrams of word contained in wordlist' do
      expect { subject.anagrams('paste') }.to output("pates\npeats\nspate"\
        "\nsepta\ntapes\ntepas\n").to_stdout
    end
  end
end
