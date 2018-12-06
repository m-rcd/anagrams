require './lib/anagrams'

describe Anagrams do
  subject(:anagrams) { described_class.new }

  context '#anagrams' do
    it 'outputs anagrams of word contained in wordlist' do
      expect { subject.anagrams('paste') }.to output("pates\npeats\nspate"\
        "\nsepta\ntapes\ntepas\n").to_stdout
    end

    it "outputs 'no anagrams found' if no anagrams" do
      expect { subject.anagrams('anagram') }.to output("No anagrams found for anagram\n").to_stdout
    end
  end
end
