require 'pry'
require 'rspec'

class Trie
   
   attr_accessor :tree

   def initialize 
      self.tree = Hash.new{|h,k| h[k]=Hash.new(&h.default_proc) }
   end

   def insert(word)
      characters = word.split("")         
      insert_string = ""
      characters.each { |char| insert_string << "['#{char}']" }
      insert_string = "self.tree" << insert_string << "[true]"
      # insert_string = "self.tree[characters.at(0)][characters.at(1)][characters.at(2)][characters.at(3)][true]"
      eval(insert_string)
   end

   def match(word)
      characters = word.split("")           
      match_string = ""
      characters.each{ |char| match_string << ".fetch('#{char}', nil)" }
      match_string = "self.tree" << match_string << ".fetch(true, nil)"
      # match_string = "self.tree.fetch(characters.at(0), nil).fetch(characters.at(1), nil).fetch(characters.at(2), nil).fetch(true, nil)"
      result = eval(match_string) rescue nil
      result == {} ? true : false 
   end
end

trie = Trie.new
trie.insert("salad")
trie.insert("sapple")
puts trie.match("salad")
puts trie.match("sapple")

