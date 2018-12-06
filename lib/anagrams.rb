require 'net/http'
require 'uri'

class Anagrams
  def initialize
    @wordlist = Net::HTTP.get(URI.parse('http://codekata.com/data/wordlist.txt')).split("\n")
  end

  def anagrams(word)
    word_permutations = permutations(word)
    words = []
    word_permutations.map! do |w|
      search = @wordlist.bsearch { |value| w <=> value }
      words << search unless search.nil?
    end
    words.delete(word)
    printer(words, word)
  end

private
  def permutations(word)
    word.split('').permutation.to_a.map!(&:join)
  end

  def printer(array, word)
    if array.empty?
      puts "No anagrams found for #{word}"
    elsif array.length == 1
      puts "Anagram for #{word} is:"
      puts array
    else
      puts "Anagrams for #{word} are:"
      puts array
    end
  end
end
