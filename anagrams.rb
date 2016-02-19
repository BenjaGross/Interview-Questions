require 'rspec'

def anagrams?(str1, str2)  
  result = true
  if str1.length != str2.length
    result = false 
  else
    w1counts = {}
    w2counts = {}
    str1.downcase.chars.collect{ |c| add_to_hash(c, w1counts)}
    str2.downcase.chars.collect{ |c| add_to_hash(c, w2counts)}
    w1counts.each do |key, value|
      if w2counts[key] == nil || w2counts[key] != value
        result = false
      end
    end
  end
  result
end

def add_to_hash(char, hash)
  if hash[char] == nil
    hash[char] = 1
  else
    hash[char]+=1
  end
end


describe 'anagrams?' do 

  let ( :gram1 )          { "boat" }
  let ( :gram2 )          { "toab" }
  let ( :false_longer )   { "boating" }
  let ( :false_same )     { "beto" }

  it 'returns true when given two anagrams' do
    expect(anagrams?(gram1, gram2)).to be(true)
  end

  it 'returns false when given non anagrams' do 
    expect(anagrams?(gram1, false_longer)).to be(false)
    expect(anagrams?(gram2, false_same)).to be(false)
  end
  
end