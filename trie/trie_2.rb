require 'pp'
require 'pry'
require 'rspec'

class Trie
   
   attr_accessor :tree

   def initialize 
      self.tree = Hash.new{|h,k| h[k]=Hash.new(&h.default_proc) }
   end

   def insert(word)
      characters = word.split(//u)  
      word_length = characters.size          
      str = ""
      word_length.times { |x| str << "[characters.at(#{x})]" }
      insert_word_string = "self.tree" << str << "[true]"
      # str = "self.tree[characters.at(0)][characters.at(1)][characters.at(2)][characters.at(3)][true]"
      eval(insert_word_string)
   end

   def match(word)
      characters = word.split(//u) 
      word_length = characters.size           
      str = ""
      word_length.times { |x| str << ".fetch(characters.at(#{x}), nil)" }
      str = "self.tree" << str << ".fetch(true, nil)"
      # str = "self.tree.fetch(characters.at(0), nil).fetch(characters.at(1), nil).fetch(characters.at(2), nil).fetch(true, nil)"
      ret = eval(str) rescue nil

      ret == {} ? true : false 
   end
end

# describe "Trie" do
#    it "returns true" do
#      collection.include?(7).should be_true
#    end

# end

trie = Trie.new
trie.insert("word")
pp Trie.hash            
p trie.match("word")      
p trie.match("word2")   
trie << "word2"
p trie.match("word2")   
pp Trie.hash            # {"w"=>{"o"=>{"r"=>{"d"=>{true=>{}, "2"=>{true=>{}}}}}}}
trie << ""
p trie.match("")
pp Trie.hash