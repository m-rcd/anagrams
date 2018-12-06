#!/usr/bin/env ruby

require './lib/anagrams'
require './lib/printer'

anagrams = Anagrams.new
ARGV.each do |a|
  anagrams.anagrams(a)
end
