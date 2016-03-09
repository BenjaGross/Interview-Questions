require 'pry'
class Trie
   
   attr_accessor :tree, :wildcard

   def initialize 
      self.wildcard = "*"
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
      characters.each do |char| 
         pointer = pointer.fetch(char, nil) rescue nil 
      end
      result = pointer.fetch(true, nil) rescue nil
      result == {} ? true : false 
   end

   def match_wildcard(word)
      characters = word.split("")           
      pointer = self.tree
      characters.each do |char| 
         if char == self.wildcard
            binding.pry
            pointer = pointer.fetch(pointer.keys.first, nil) rescue nil 
         else
            pointer = pointer.fetch(char, nil) rescue nil 
         end
      end
      result = pointer.fetch(true, nil) rescue nil
      result == {} ? true : false 
   end
end

trie = Trie.new
trie.insert("salad")
trie.insert("sapple")
trie.insert("bramble")
trie.insert("brad")
# print "Expect True: " 
# puts trie.match("salad")
# print "Expect True with wildcard: " 
# puts trie.match("s*lad")
# print "Expect True: " 
# puts trie.match("sapple")
# print "Expect false: " 
# puts trie.match("salads")

print "Expect True"
puts trie.match_wildcard("s*pple")
