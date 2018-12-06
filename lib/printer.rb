class Printer
  def print(array, word)
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
