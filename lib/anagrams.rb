require 'net/http'
require 'uri'

class Anagrams
  def initialize(printer = Printer.new)
    @wordlist = Net::HTTP.get(URI.parse('http://codekata.com/data/wordlist.txt')).split("\n")
    @printer = printer
  end

  def anagrams(word)
    word_permutations = permutations(word)
    words = []
    word_permutations.map! do |w|
      search = @wordlist.bsearch { |value| w <=> value }
      words << search unless search.nil?
    end
    w = word.downcase.delete '-'
    words.delete(w)
    @printer.print(words, word)
  end

private

  def permutations(word)
    w = hyphenated?(word) ? (word.delete '-') : word
    w.downcase.split('').permutation.to_a.map!(&:join)
  end

  def hyphenated?(word)
    word.include? '-'
  end
end
