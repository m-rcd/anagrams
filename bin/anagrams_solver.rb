#!/usr/bin/env ruby

require './lib/anagrams'

anagrams = Anagrams.new
ARGV.each do |a|
  anagrams.anagrams(a)
end
