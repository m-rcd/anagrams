require './lib/printer'

describe Printer do
  subject(:printer) { described_class.new }

  context "prints anagrams for a given word" do
    it "multiple anagrams" do
      array = ["pates", "peats", "spate", "septa"]
      word = "paste"
      expect { subject.print(array, word) }.to output("Anagrams for paste are:" \
        "\npates\npeats\nspate\nsepta\n").to_stdout
    end

    it "one anagram" do
      array = ["act"]
      word = "cat"
      expect { subject.print(array, word) }.to output("Anagram for cat is:\nact\n").to_stdout
    end

    it "no anagrams" do
      array = []
      word = "anagrams"
      expect { subject.print(array, word) }.to output("No anagrams found for anagrams\n").to_stdout
    end
  end
end
