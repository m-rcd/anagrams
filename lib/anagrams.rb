require 'net/http'
require 'uri'

class Anagrams
  def initialize
    @wordlist = Net::HTTP.get(URI.parse('http://codekata.com/data/wordlist.txt')).split("\n")
  end

  def anagrams(word)
    words = permutations(word)
    words.map! do |w|
      binary_search(@wordlist, w)
    end
    words.delete(word)
    puts words.compact
  end

  def permutations(word)
    word.split('').permutation.to_a.map!(&:join)
  end

  def binary_search(array, word)
    low, high = 0, array.length - 1
    while low <= high
      mid = (low + high) >> 1
      case word <=> array[mid]
      when 1
        low = mid + 1
      when -1
        high = mid - 1
      else
        return word
      end
    end
  end
end
