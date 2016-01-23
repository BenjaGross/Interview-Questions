require 'rspec'


class Brackets 

  def self.test_brackets(input)
    stack = []
    brack = input.split("").flatten
    result = true
    bracket_hash = {"]" => "[", "}" => "{", ")" => "(", ">" => "<"}
    opening_brackets = bracket_hash.values

    brack.each do |bracket|
      if opening_brackets.include?(bracket)
        stack.push(bracket)
      else 
        b = stack.pop
        result = b == bracket_hash[bracket]
      end
    end
    result
  end
end


describe 'Brackets' do 
  let( :valid_string) { "([](<{}>))" }
  let( :invalid_string) {"({<)>}"}

  it "returns true with a valid brakcet string" do
    expect(Brackets.test_brackets(valid_string)).to be(true)
  end

  it "returns false with an invalid bracket string" do 
    expect(Brackets.test_brackets(invalid_string)).to be(false)
  end

end



