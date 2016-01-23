require 'rspec'

class Brackets 

  def self.test_brackets(input)
    stack = []
    brack = input.split("").flatten
    bracket_hash = {"]" => "[", "}" => "{", ")" => "(", ">" => "<", "’" => "‘", '”' => '“'}
    opening_brackets = bracket_hash.values
    result = true
    i = 0
    while (result == true) && (i < brack.length)
      if opening_brackets.include?(brack[i])
        stack.push(brack[i])
        i+=1
      else
        b = stack.pop
        result = b == bracket_hash[brack[i]]
        i +=1
      end
    end
    result && stack.length == 0
  end

end

describe 'Brackets' do 
  let( :valid_string) { "([](<{}>))" }
  let( :invalid_string) { "({<)>}" }
  let( :valid_with_quotes) { "([‘’](<{}>))" }
  let( :invalid_with_quotes) {"([‘](’<{}>))"}

  it "returns true with a valid brakcet string" do
    expect(Brackets.test_brackets(valid_string)).to be(true)
    expect(Brackets.test_brackets(valid_with_quotes)).to be(true)
  end

  it "returns false with an invalid bracket string" do 
    expect(Brackets.test_brackets(invalid_string)).to be(false)
    expect(Brackets.test_brackets(invalid_with_quotes)).to be(false)
  end


end