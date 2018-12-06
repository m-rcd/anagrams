require 'mixlib/shellout'
require './bin/anagrams_solver'

describe 'Running the program from the command line' do
  subject(:anagrams) { described_class.new }

  it 'should exit zero' do
    anagrams = Mixlib::ShellOut.new("./bin/anagrams_solver.rb")
    anagrams.run_command
    expect(anagrams.exitstatus).to eq 0
  end

  it 'should print anagrams' do
    anagrams = Mixlib::ShellOut.new("./bin/anagrams_solver.rb paste")
    anagrams.run_command
    expect(anagrams.stdout).to eq "Anagrams for paste are:"\
    "\npates\npeats\nspate\nsepta\ntapes\ntepas\n"
  end

  it 'can take multiple arguments' do
    anagrams = Mixlib::ShellOut.new("./bin/anagrams_solver.rb paste cat")
    anagrams.run_command
    expect(anagrams.stdout).to eq "Anagrams for paste are:\npates\npeats\nspate\nsepta"\
    "\ntapes\ntepas\nAnagram for cat is:\nact\n"
  end
end
