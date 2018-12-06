class Anagrams

  def permutations(word)
    word.split('').permutation.to_a.map!(&:join)
  end
end
