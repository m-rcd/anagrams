class Anagrams

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
