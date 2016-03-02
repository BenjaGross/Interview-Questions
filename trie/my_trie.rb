require 'pry'
require 'rspec'

class Trie
   
   attr_accessor :tree

   def initialize 
      self.tree = Hash.new{|h,k| h[k]=Hash.new(&h.default_proc) }
   end

   def insert(word)
      characters = word.split("")         
      pointer = self.tree
      characters[0..-2].each{ |char| pointer = pointer[char] }
      pointer = pointer[characters.last][true]
   end

   def match(word)
      characters = word.split("")           
      pointer = self.tree
      characters.each { |char| pointer = pointer.fetch(char, nil) rescue nil }
      result = pointer.fetch(true, nil) rescue nil
      result == {} ? true : false 
   end
end

trie = Trie.new
trie.insert("salad")
trie.insert("sapple")
trie.insert("bramble")
trie.insert("brad")
puts trie.match("salad")
puts trie.match("sapple")
puts trie.match("salads")
puts trie.tree

