letters = "a".."d"
numbers = 1..3

letters.zip(numbers) do |letter, number|
  p(letter: letter, number: number)
end

# Result:
# {:letter=>"a", :number=>1}
# {:letter=>"b", :number=>2}
# {:letter=>"c", :number=>3}
# {:letter=>"d", :number=>nil}
