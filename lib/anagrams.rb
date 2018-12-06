require 'net/http'
require 'uri'

class Anagrams
  def initialize
    @wordlist = Net::HTTP.get(URI.parse('http://codekata.com/data/wordlist.txt')).split("\n")
    @words = []
  end

  def anagrams(word)
    word_permutations = permutations(word)
    word_permutations.map! do |w|
      search = @wordlist.bsearch { |value| w <=> value }
      @words << search unless search.nil?
    end
    @words.delete(word)
    puts "No anagrams found for #{word}" if @words.empty?
    puts @words
  end
  
  def permutations(word)
    word.split('').permutation.to_a.map!(&:join)
  end
end
