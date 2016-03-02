class Trie
   
   attr_accessor :tree

   def initialize 
      self.tree = Hash.new{|h,k| h[k]=Hash.new(&h.default_proc) }
   end

   def insert(word)
      characters = word.split(//u)  
      word_length = characters.size          
      insert_word_string = ""
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