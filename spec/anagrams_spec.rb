require './lib/anagrams'

describe Anagrams do
  subject(:anagrams) { described_class.new }

  context '#anagrams' do
    it 'outputs anagrams of word contained in wordlist' do
      expect { subject.anagrams('paste') }.to output("Anagrams for paste are:\npates\npeats\nspate"\
        "\nsepta\ntapes\ntepas\n").to_stdout
    end

    it 'outputs anagrams of word with capital letters' do
      expect { subject.anagrams('Paste') }.to output("Anagrams for Paste are:\npates\npeats\nspate"\
        "\nsepta\ntapes\ntepas\n").to_stdout
    end

    it "outputs 'Anagram of word is' if only one anagram" do
      expect { subject.anagrams('cat') }.to output("Anagram for cat is:\nact\n").to_stdout
    end

    it "outputs 'no anagrams found' if no anagrams" do
      expect { subject.anagrams('anagram') }.to output("No anagrams found for anagram\n").to_stdout
    end
  end
end
