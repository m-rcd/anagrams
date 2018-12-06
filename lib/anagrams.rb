class Anagrams

  def permutations(word)
    word.split('').permutation.to_a.map! do |w|
      w.join
    end
  end
end
