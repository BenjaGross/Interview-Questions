require 'pp'
require 'pry'
class Hash
   def Hash.new_nested_hash
     Hash.new{|h,k| h[k]=Hash.new(&h.default_proc) }
   end
end
class Trie
   @hash = Hash.new_nested_hash
   #@hash = Hash.new_nested_hash.update(true=>{})  # add empty string by default
   class << self; attr_accessor :hash; end    # Trie.hash
   def <<(word)
      ca = word.split(//u)    # UTF-8 aware character array
      wl = ca.size            # word length
      str = ""
      wl.times { |x| str << "[ca.at(#{x})]" }
      str = "Trie.hash" << str << "[true]"
      #p str     # example: "Trie.hash[ca.at(0)][ca.at(1)][ca.at(2)][ca.at(3)][true]"
      eval(str)
   end
   def match(word)
      ca = word.split(//u)    # UTF-8 aware character array
      wl = ca.size            # word length
      str = ""
      wl.times { |x| str << ".fetch(ca.at(#{x}),nil)" }
      str = "Trie.hash" << str << ".fetch(true,nil)"
      #p str   # example: "Trie.hash.fetch(ca.at(0),nil).fetch(ca.at(1),nil).fetch(ca.at(2),nil).fetch(true,nil)"
      ret = eval(str) rescue nil
=begin
      # alternative
      wl.times { |x| str << ".fetch(ca.at(#{x}),{})" }
      str = "Trie.hash" << str << ".fetch(true,nil)"
      #p str   # example: "Trie.hash.fetch(ca.at(0),{}).fetch(ca.at(1),{}).fetch(ca.at(2),{}).fetch(true,nil)"
      ret = eval(str)
=end
      ret == {} ? true : false   # {} is the default value created by Trie.hash or Hash.new_nested_hash respectively
   end
end
trie = Trie.new
trie << "word"
pp Trie.hash            
p trie.match("word")      
p trie.match("word2")   
trie << "word2"
p trie.match("word2")   
pp Trie.hash            # {"w"=>{"o"=>{"r"=>{"d"=>{true=>{}, "2"=>{true=>{}}}}}}}
trie << ""
p trie.match("")
pp Trie.hash